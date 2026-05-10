# Video Auto — 视频自动化处理模块

> 这是 [Merge-DeepSeek-Local](https://github.com/wudake/Merge-DeepSeek-Local) 项目的子模块，作为 Docker Compose 集群的一部分运行。如需部署整个项目，请参考 [根目录 README](../../README.md)。

一款面向内容创作者的**全功能视频自动化处理工具**，支持**视频下载**、**AI 配音 (TTS)**、**智能剪辑**、**多平台适配**一站式完成。

---

## 在集成项目中的位置

```
Merge-DeepSeek-Local/
├── docker-compose.yml       ← video-auto 作为一个 service 运行
├── frontend/                ← React 前端通过 /video-auto 路径嵌入
└── services/video-auto/     ← 本目录
```

通过根目录 `docker compose up -d` 一键启动所有服务，video-auto 运行在 Nginx 反向代理后，通过 `http://localhost/video-auto/` 访问。

---

## 🎯 核心功能

### 📥 视频获取
| 功能 | 状态 | 说明 |
|------|------|------|
| **小红书视频下载** | ✅ | Playwright 模拟浏览器抓取，稳定可靠 |
| **抖音视频下载** | ✅ | MeowLoad API 支持，抖音链接一键下载 |
| **本地上传视频** | ✅ | 支持 MP4, MOV, AVI, MKV, WEBM, M4V |

### 🎙️ AI 配音 (TTS)
| 功能 | 说明 |
|------|------|
| **多音色选择** | 22 种英文音色：美式英语（17种）、英式英语（5种） |
| **语速调节** | 0.5x - 2.0x 自由调节 |
| **在线试听** | 生成后可立即预览效果 |
| **视频配音** | TTS 音频可直接用于替换/混合视频原声 |
| **音色预览** | Ana, Aria, Emma, Jenny, Michelle 等 |
| **字幕语言自动识别** | TTS 字幕语言根据内容自动识别 |

**支持音色：**
- 🇺🇸 美式英语（17种）：Ana, Aria, Ava, Emma, Jenny, Michelle, Andrew, Brian, Christopher, Eric, Guy, Roger, Steffan 等
- 🇬🇧 英式英语（5种）：Libby, Maisie, Sonia, Ryan, Thomas

### ✂️ 智能剪辑
| 功能 | 说明 |
|------|------|
| **Logo 水印** | 5 种位置可选，支持大小调节 (5%-30%) |
| **BGM 混音** | 支持 MP3/M4A/WAV，**自动循环播放至视频结束**，可调节音量、混音或完全替换原声 |
| **TTS 配音** | 用 AI 生成的语音替代原声 |
| **水平镜像** | 一键翻转，适合去重处理 |
| **调速** | 0.8x - 2.0x 连续可调 |
| **调色** | 亮度 / 对比度 / 饱和度调节 |
| **字幕添加** | 自定义内容、样式、位置、时间段 |
| **裁剪首尾** | 精确去除开头/结尾片段 |
| **9:16 竖屏** | 自动适配抖音/Instagram/TikTok |

### 📱 便捷功能
| 功能 | 说明 |
|------|------|
| **二维码下载** | 生成视频下载二维码，手机扫码直接获取 |
| **实时预览** | 剪辑完成后在线预览 |
| **任务日志** | 实时显示处理进度和详细日志 |
| **BGM 排序** | 按文件名自动排序，便于管理 |

---

## 🛠️ 技术栈

| 组件 | 技术 |
|------|------|
| 后端 | Python + Flask |
| 视频处理 | FFmpeg |
| TTS 引擎 | edge-tts (微软 Azure 免费接口) |
| 浏览器自动化 | Playwright |
| 视频下载 | yt-dlp (备用) |
| 前端 | HTML5 + CSS3 + JavaScript |

---

## 部署方式

本模块作为 Merge-DeepSeek-Local 的一部分通过 Docker Compose 部署。详见 [根目录部署文档](../../README.md#快速开始)。

```bash
# 在项目根目录执行
docker compose up -d
```

独立开发/调试请参考 [DOCKER.md](./DOCKER.md)。

---

## 📁 目录结构

```
video-auto/
├── app_simple.py              # Flask 主应用
├── core/
│   ├── editor_advanced.py     # 视频编辑器
│   ├── tts_generator.py       # TTS 语音生成器
│   ├── downloader_pw.py       # 小红书下载器
│   ├── douyin_downloader.py   # 抖音下载器
│   ├── publish_assistant.py   # 发布助手
│   └── qr_generator.py        # 二维码生成器
├── templates/                 # Flask Jinja2 模板
│   ├── index.html
│   ├── index_multi_user.html
│   ├── login.html
│   └── auth/login.html
├── assets/
│   ├── logos/                 # Logo 文件
│   ├── bgm/                   # BGM 音乐 (27首)
│   └── tts/                   # TTS 生成文件
├── static/                    # 二维码等静态文件
├── videos/configs/            # 视频剪辑配置
├── output/                    # 剪辑后视频
└── docs/                      # 模块文档
```

---

## 📖 使用指南

### 方式一：小红书链接下载

1. 打开 Web 界面
2. 在"链接下载"选项卡粘贴小红书视频链接
3. 点击"开始下载"
4. 下载完成后自动跳转到剪辑配置

### 方式二：本地上传视频

1. 切换到"本地上传"选项卡
2. 点击上传区域选择本地视频文件
3. 支持格式：MP4, MOV, AVI, MKV, WEBM, M4V
4. 上传成功后自动跳转到剪辑配置

### AI 配音使用流程

1. **生成语音** — 在 TTS 面板输入文案，选择音色，调节语速，点击"生成语音"
2. **试听确认** — 生成后可立即试听，不满意可重新生成
3. **应用到视频** — 剪辑时勾选"使用 TTS 配音"，选择已生成的 TTS 文件

### 视频剪辑配置

**Logo 设置** — 上传 Logo 文件 (PNG 透明背景最佳)，选择位置（左上/右上/左下/右下/底部居中），调节大小 (5%–30%)

**BGM 设置** — 上传 BGM 文件 (MP3/M4A/WAV)，BGM 列表按文件名自动排序，调节原声/BGM 音量

**TTS 配音设置** — 输入配音文案，选择音色（22种可选），调节语速，生成并试听，应用到视频

**字幕设置** — 勾选"添加字幕"，输入内容，设置显示时间段，选择样式和位置

**视频效果** — 水平镜像（去重）、裁剪首尾、播放速度 0.8x–2.0x、调色优化

---

## ⚙️ 配置说明

### 视频剪辑默认参数

| 参数 | 默认值 | 说明 |
|------|--------|------|
| 裁剪首尾 | 0.5秒 | 去除开头/结尾 |
| 播放速度 | 1.05x | 轻微加速 |
| Logo 大小 | 12% | 相对视频宽度 |
| 输出比例 | 9:16 | 1080x1920 |

### Logo 位置详情

| 位置 | 距离左边缘 | 距离上边缘 | 距离右边缘 | 距离下边缘 |
|------|-----------|-----------|-----------|-----------|
| 左上 | 84px | 104px | - | - |
| 右上 | - | 30px | 30px | - |
| 左下 | 30px | - | - | 30px |
| 右下 | - | - | 30px | 30px |
| 底部居中 | - | - | - | 30px |

### 自定义配置

编辑 `core/editor_advanced.py` 中的配置：
- `PRESETS` - 剪辑预设
- `SUBTITLE_STYLES` - 字幕样式

---

## 🔌 API 接口

### 获取视频

```bash
# 链接下载
POST /api/download
{"url": "https://www.xiaohongshu.com/explore/xxx"}

# 本地上传
POST /api/upload/video
Content-Type: multipart/form-data
file: [视频文件]
```

### 🎙️ TTS 相关

```bash
# 获取可用音色列表
GET /api/tts/voices

# 生成 TTS 语音
POST /api/tts/generate
{
  "text": "你好，这是测试语音",
  "voice": "zh-CN-XiaoxiaoNeural",
  "speed": 1.0
}

# 试听 TTS 音频
GET /api/tts/preview/<filename>

# 列出所有 TTS 文件
GET /api/tts/list

# 使用 TTS 剪辑视频
POST /api/tts/edit
{
  "note_id": "视频ID",
  "tts_filename": "tts_xxx.mp3",
  "config": { ... }
}
```

### 剪辑视频

```bash
POST /api/edit
{
  "note_id": "视频ID",
  "config": {
    "crop_top": 0.5,
    "speed": 1.05,
    "hflip": true,
    "add_logo": true,
    "logo_position": "top_left",
    "use_tts": true,          # 使用 TTS
    "tts_filename": "tts_xxx.mp3",
    ...
  }
}
```

### 资源管理

```bash
GET  /api/logos/list           # Logo 列表
GET  /api/bgm/list             # BGM 列表（已排序）
POST /api/upload/logo          # 上传 Logo
POST /api/upload/bgm           # 上传 BGM
GET  /api/logs/edit/latest     # 剪辑日志
GET  /api/qr/ip                # 获取服务器 IP
GET  /api/qr/generate/<filename>  # 生成下载二维码
```

---

## ⚠️ 注意事项

1. **小红书链接有时效性**，请使用最新分享的链接
2. **视频剪辑需要 FFmpeg**，请确保已安装
3. **本地上传视频大小**，建议不超过 500MB
4. **TTS 使用 edge-tts**，需要网络连接（微软 Azure 免费接口）
5. **抖音下载已暂停**，如需使用需配置 Cookie（见 `cookies/README.md`）
6. **建议仅用于个人学习和合法用途**

---

## ❓ 常见问题

### Q: 剪辑时报错"网络错误"？
A: 可能是服务已停止，请检查服务状态或重启服务。

### Q: 小红书下载失败？
A: 链接可能已过期，请重新从 App 复制分享链接。

### Q: TTS 生成失败？
A: 请检查网络连接，TTS 需要访问微软 Azure 服务。

### Q: 本地上传后找不到文件？
A: 检查 `videos/raw/` 目录，上传的文件会保存在这里。

### Q: Logo 位置如何调整？
A: 编辑 `core/editor_advanced.py` 中的 `pos_map` 配置。

---

## 📝 版本历史

| 版本 | 日期 | 更新内容 |
|------|------|---------|
| **v6.0.0+** | **2026-04-20** | **仅保留22个英文TTS音色，字幕语言自动识别，安全边距修复，TTS音色测试** |
| v5.4.0 | 2026-03-26 | 新增HTTPS支持、字幕样式预设、修复Chromium路径 |
| v5.2.0 | 2026-03-25 | 新增抖音API下载、TTS音色修复35个、BGM循环播放、修复上传bug |
| v3.1 | 2026-03-24 | 新增 TTS 语音配音功能、二维码下载 |
| v3.0 | 2026-03-17 | 新增本地上传、BGM排序、优化Logo位置 |
| v2.2 | 2026-03-14 | 自定义字幕、错误日志显示 |
| v2.1 | 2026-03-13 | 多用户支持、任务队列 |
| v2.0 | 2026-03-12 | Whisper字幕识别 |
| v1.0 | 2026-03-10 | 基础功能 |

---

## 📚 相关文档

- [需求文档](docs/REQUIREMENTS.md) — 详细功能需求
- [Docker 独立部署](DOCKER.md) — 模块独立 Docker 部署
- [多用户方案](docs/3_USERS_PLAN.md) — 3 人团队使用方案
- [Cookie 配置](cookies/README.md) — 抖音 Cookie 配置
- [项目总览](../../README.md) — 回到 Merge-DeepSeek-Local 主文档

---

## 📄 License

MIT
