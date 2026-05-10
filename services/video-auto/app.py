"""
Video Auto Web API - 统一版 (支持 JWT)
Flask + Jinja2，通过 iframe 嵌入统一前端
"""
import os
import sys
import json
import subprocess
from functools import wraps
from pathlib import Path
from werkzeug.utils import secure_filename
from flask import Flask, render_template, request, jsonify, send_from_directory, session, redirect, url_for

app = Flask(__name__)
app.config['MAX_CONTENT_LENGTH'] = 50 * 1024 * 1024
app.secret_key = os.environ.get('FLASK_SECRET', 'video-auto-secret-key-change-me')

BASE_DIR = Path(__file__).parent
JWT_SECRET = os.environ.get('JWT_SECRET', 'app-shared-jwt-secret-change-me')

# 添加路径
sys.path.insert(0, str(BASE_DIR / "core"))


def _verify_jwt(token: str):
    """验证 JWT token，返回 payload 或 None"""
    try:
        import jwt as pyjwt
        return pyjwt.decode(token, JWT_SECRET, algorithms=["HS256"])
    except Exception:
        return None


def jwt_required(f):
    """装饰器：JWT 优先，session 回退"""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # 如果已有 session 登录，直接放行
        if session.get('jwt_authenticated') or session.get('logged_in'):
            return f(*args, **kwargs)

        # 1. 从查询参数获取 JWT token (iframe 场景)
        token = request.args.get('token')

        # 2. 从 Authorization header 获取
        if not token:
            auth_header = request.headers.get('Authorization', '')
            if auth_header.startswith('Bearer '):
                token = auth_header[7:]

        # 3. 验证 JWT
        if token:
            payload = _verify_jwt(token)
            if payload:
                session['jwt_authenticated'] = True
                session['logged_in'] = True
                session['username'] = payload.get('username', 'unknown')
                session['user_id'] = payload.get('sub', 'unknown')
                return f(*args, **kwargs)
            else:
                return redirect(url_for('login_page', error='token_expired', token=token))

        # 无任何认证，跳转登录页
        return redirect(url_for('login_page', token=request.args.get('token', '')))

    return decorated_function


@app.route("/login", methods=["GET", "POST"])
def login_page():
    """登录页：JWT 自动登录或表单登录"""
    token = request.args.get('token')
    if token:
        payload = _verify_jwt(token)
        if payload:
            session['jwt_authenticated'] = True
            session['logged_in'] = True
            session['username'] = payload.get('username', 'unknown')
            session['user_id'] = payload.get('sub', 'unknown')
            return redirect(url_for('index'))
        else:
            error = request.args.get('error', '')
            return render_template('login.html', error=error or 'Token 已过期，请刷新页面', token=token)

    if request.method == "POST":
        # 保留原有的密码表单登录逻辑
        pwd = request.form.get('password', '')
        if pwd == os.environ.get('VIDEO_AUTO_PASSWORD', ''):
            session['logged_in'] = True
            session['username'] = 'admin'
            return redirect(url_for('index'))
        return render_template('login.html', error='密码错误')

    return render_template('login.html', token=token, error=request.args.get('error', ''))


@app.route("/")
@jwt_required
def index():
    return render_template("index.html")


@app.route("/api/download", methods=["POST"])
@jwt_required
def download_video():
    """下载小红书视频 - 使用独立脚本文件"""
    data = request.json
    url = data.get("url", "").strip()

    if not url:
        return jsonify({"success": False, "error": "URL 不能为空"})

    # 保存 URL 到临时文件
    temp_file = BASE_DIR / ".temp_url.txt"
    temp_file.write_text(url, encoding='utf-8')

    try:
        # 运行下载脚本
        script_path = BASE_DIR / "download_worker.py"
        result = subprocess.run(
            [sys.executable, str(script_path)],
            capture_output=True,
            text=True,
            timeout=90,
            cwd=str(BASE_DIR)
        )

        # 读取结果
        result_file = BASE_DIR / ".temp_result.json"
        if result_file.exists():
            download_result = json.loads(result_file.read_text(encoding='utf-8'))
            result_file.unlink()
        else:
            return jsonify({"success": False, "error": "下载器未返回结果"})

        temp_file.unlink(missing_ok=True)

        if download_result.get("status") == "success":
            return jsonify({
                "success": True,
                "data": {
                    "note_id": download_result["note_id"],
                    "video_path": download_result["output_path"],
                    "size_mb": round(download_result.get("size_mb", 0), 2)
                }
            })
        else:
            return jsonify({
                "success": False,
                "error": download_result.get("error", "下载失败")
            })

    except subprocess.TimeoutExpired:
        temp_file.unlink(missing_ok=True)
        return jsonify({"success": False, "error": "下载超时，请重试"})
    except Exception as e:
        temp_file.unlink(missing_ok=True)
        return jsonify({"success": False, "error": f"下载出错: {str(e)}"})


@app.route("/api/edit", methods=["POST"])
@jwt_required
def edit_video():
    """剪辑视频"""
    data = request.json
    note_id = data.get("note_id")
    config = data.get("config", {})

    if not note_id:
        return jsonify({"success": False, "error": "未指定视频"})

    # 保存配置
    temp_config = BASE_DIR / ".temp_config.json"
    temp_config.write_text(json.dumps({"note_id": note_id, "config": config}), encoding='utf-8')

    try:
        script_path = BASE_DIR / "edit_worker.py"
        result = subprocess.run(
            [sys.executable, str(script_path)],
            capture_output=True,
            text=True,
            timeout=120,
            cwd=str(BASE_DIR)
        )

        result_file = BASE_DIR / ".temp_edit_result.json"
        if result_file.exists():
            edit_result = json.loads(result_file.read_text(encoding='utf-8'))
            result_file.unlink()
        else:
            temp_config.unlink(missing_ok=True)
            return jsonify({"success": False, "error": "剪辑器未返回结果"})

        temp_config.unlink(missing_ok=True)

        if edit_result.get("success"):
            output_name = edit_result["output_name"]
            return jsonify({
                "success": True,
                "data": {
                    "output_name": output_name,
                    "preview_url": f"/api/preview/{output_name}",
                    "download_url": f"/api/download/edited/{output_name}"
                }
            })
        else:
            return jsonify({"success": False, "error": edit_result.get("error", "剪辑失败")})

    except subprocess.TimeoutExpired:
        temp_config.unlink(missing_ok=True)
        return jsonify({"success": False, "error": "剪辑超时"})
    except Exception as e:
        temp_config.unlink(missing_ok=True)
        return jsonify({"success": False, "error": f"剪辑出错: {str(e)}"})


@app.route("/api/logos/list")
@jwt_required
def list_logos():
    """列出所有 Logo"""
    logos_dir = BASE_DIR / "assets" / "logos"
    logos = []
    if logos_dir.exists():
        for f in logos_dir.glob("*.png"):
            stat = f.stat()
            logos.append({
                "name": f.name,
                "size_kb": round(stat.st_size / 1024, 1)
            })
    return jsonify({"logos": logos})


@app.route("/api/upload/logo", methods=["POST"])
@jwt_required
def upload_logo():
    if "file" not in request.files:
        return jsonify({"success": False, "error": "没有文件"})

    file = request.files["file"]
    if file.filename == "":
        return jsonify({"success": False, "error": "文件名不能为空"})

    if file and file.filename.lower().endswith((".png", ".jpg", ".jpeg")):
        filename = secure_filename(file.filename)
        logos_dir = BASE_DIR / "assets" / "logos"
        logos_dir.mkdir(exist_ok=True)
        file.save(logos_dir / filename)
        return jsonify({"success": True, "message": f"Logo {filename} 上传成功"})

    return jsonify({"success": False, "error": "仅支持 PNG/JPG 格式"})


@app.route("/api/upload/bgm", methods=["POST"])
@jwt_required
def upload_bgm():
    if "file" not in request.files:
        return jsonify({"success": False, "error": "没有文件"})

    file = request.files["file"]
    if file.filename == "":
        return jsonify({"success": False, "error": "文件名不能为空"})

    if file and file.filename.lower().endswith((".mp3", ".m4a", ".wav")):
        filename = secure_filename(file.filename)
        bgm_dir = BASE_DIR / "assets" / "bgm"
        bgm_dir.mkdir(exist_ok=True)
        file.save(bgm_dir / filename)
        return jsonify({"success": True, "message": f"BGM {filename} 上传成功"})

    return jsonify({"success": False, "error": "仅支持 MP3/M4A/WAV 格式"})


@app.route("/api/bgm/list")
@jwt_required
def list_bgm():
    bgm_dir = BASE_DIR / "assets" / "bgm"
    bgms = []
    if bgm_dir.exists():
        for f in bgm_dir.glob("*"):
            if f.suffix.lower() in [".mp3", ".m4a", ".wav"]:
                stat = f.stat()
                bgms.append({"name": f.name, "size_mb": round(stat.st_size / 1024 / 1024, 2)})
    return jsonify({"bgms": bgms})


@app.route("/api/bgm/preview/<filename>")
@jwt_required
def preview_bgm(filename):
    """BGM 试听"""
    safe_filename = secure_filename(filename)
    bgm_path = BASE_DIR / "assets" / "bgm" / safe_filename
    if not bgm_path.exists():
        return jsonify({"error": "文件不存在"}), 404
    return send_from_directory(BASE_DIR / "assets" / "bgm", safe_filename)


@app.route("/api/download/edited/<filename>")
@jwt_required
def download_edited(filename):
    output_dir = BASE_DIR / "output"
    return send_from_directory(output_dir, filename, as_attachment=True)


@app.route("/api/preview/<filename>")
@jwt_required
def preview_video(filename):
    output_dir = BASE_DIR / "output"
    return send_from_directory(output_dir, filename)


@app.route("/api/output/list")
@jwt_required
def list_output():
    output_dir = BASE_DIR / "output"
    videos = []
    if output_dir.exists():
        for f in sorted(output_dir.glob("*.mp4"), key=lambda x: x.stat().st_mtime, reverse=True):
            stat = f.stat()
            import datetime
            videos.append({
                "name": f.name,
                "size_mb": round(stat.st_size / 1024 / 1024, 2),
                "created": datetime.datetime.fromtimestamp(stat.st_mtime).strftime("%Y-%m-%d %H:%M"),
                "preview_url": f"/api/preview/{f.name}",
                "download_url": f"/api/download/edited/{f.name}"
            })
    return jsonify({"videos": videos})


if __name__ == "__main__":
    print("🚀 启动 Video Auto Web 服务...")
    print("📱 http://localhost:5000")
    app.run(host="0.0.0.0", port=5000, debug=False, threaded=True)
