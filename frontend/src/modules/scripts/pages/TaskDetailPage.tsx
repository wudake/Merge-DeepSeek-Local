import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { Card, Button, Tag, Typography, Space, Spin, Descriptions, Tooltip, message } from 'antd'
import { ArrowLeftOutlined, DownloadOutlined, CheckCircleOutlined, ExclamationCircleOutlined, CopyOutlined, CheckOutlined, VideoCameraOutlined, LoadingOutlined } from '@ant-design/icons'
import { tasksApi, type TaskInfo, type TaskResult } from '../../../api/scripts/tasks'
import { useWebSocket } from '../hooks/useWebSocket'

const { Title, Text, Paragraph } = Typography

const statusConfig: Record<string, { label: string; color: string }> = {
  pending: { label: '等待中', color: 'default' },
  downloading: { label: '下载中', color: 'processing' },
  extracting_audio: { label: '提取音频', color: 'purple' },
  transcribing: { label: '识别中', color: 'warning' },
  completed: { label: '完成', color: 'success' },
  failed: { label: '失败', color: 'error' },
}

export default function TaskDetailPage() {
  const { taskId } = useParams()
  const [task, setTask] = useState<TaskInfo | null>(null)
  const [result, setResult] = useState<TaskResult | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [copied, setCopied] = useState(false)

  const handleCopy = async (text: string) => {
    try {
      await navigator.clipboard.writeText(text)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      const ta = document.createElement('textarea')
      ta.value = text
      document.body.appendChild(ta)
      ta.select()
      document.execCommand('copy')
      document.body.removeChild(ta)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    }
  }

  const fetchData = async () => {
    if (!taskId) return
    setLoading(true)
    try {
      const [tRes, rRes] = await Promise.all([
        tasksApi.get(taskId),
        tasksApi.getResult(taskId).catch(() => null),
      ])
      setTask(tRes.data)
      if (rRes) setResult(rRes.data)
    } catch (err: any) {
      setError(err.response?.data?.detail || '获取任务失败')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchData()
    const interval = setInterval(fetchData, 3000)
    return () => clearInterval(interval)
  }, [taskId])

  useWebSocket((msg) => {
    if (msg.task_id === taskId) {
      setTask((prev) => prev ? { ...prev, progress: msg.progress ?? prev.progress, status: (msg.status as any) ?? prev.status } : prev)
    }
  })

  if (loading && !task) {
    return (
      <div style={{ textAlign: 'center', padding: 80 }}>
        <Spin size="large" />
      </div>
    )
  }

  if (error || !task) {
    return (
      <div style={{ textAlign: 'center', padding: 80 }}>
        <ExclamationCircleOutlined style={{ fontSize: 48, color: '#ff4d4f', display: 'block', marginBottom: 16 }} />
        <Text type="danger">{error || '任务不存在'}</Text>
        <br />
        <Link to="/scripts/tasks" style={{ marginTop: 16, display: 'inline-block' }}>
          <Button type="link">返回任务列表</Button>
        </Link>
      </div>
    )
  }

  const s = statusConfig[task.status] || statusConfig.pending

  return (
    <div style={{ maxWidth: 768, margin: '0 auto' }}>
      <Link to="/scripts/tasks">
        <Button type="link" icon={<ArrowLeftOutlined />} style={{ padding: 0, marginBottom: 16 }}>
          返回列表
        </Button>
      </Link>

      <Card style={{ borderRadius: 8 }}>
        <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: 24 }}>
          <div>
            <Title level={4} style={{ margin: 0 }}>任务详情</Title>
            <Text type="secondary" copyable style={{ fontSize: 12, fontFamily: 'monospace' }}>{task.id}</Text>
          </div>
          <Tag color={s.color} style={{ fontSize: 14, padding: '2px 12px' }}>{s.label}</Tag>
        </div>

        <div style={{ marginBottom: 24 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
            <Text>处理进度</Text>
            <Text>{task.progress}%</Text>
          </div>
          <div style={{ background: '#f0f0f0', borderRadius: 4, height: 8, overflow: 'hidden' }}>
            <div style={{ background: '#1677ff', height: '100%', borderRadius: 4, transition: 'width 0.5s', width: `${task.progress}%` }} />
          </div>
        </div>

        <Descriptions column={2} size="small" bordered style={{ marginBottom: 24 }}>
          <Descriptions.Item label="视频链接">
            <a href={task.url} target="_blank" rel="noopener noreferrer">{task.url}</a>
          </Descriptions.Item>
          <Descriptions.Item label="语言 / 格式">{task.language} / {task.output_format.toUpperCase()}</Descriptions.Item>
          <Descriptions.Item label="引擎">{task.use_local ? `本地 (${task.model_size})` : 'OpenAI API'}</Descriptions.Item>
          <Descriptions.Item label="创建时间">{new Date(task.created_at).toLocaleString('zh-CN')}</Descriptions.Item>
        </Descriptions>

        {task.error_message && (
          <div style={{ background: '#fff2f0', color: '#ff4d4f', padding: '12px 16px', borderRadius: 6, marginBottom: 24, fontSize: 14, border: '1px solid #ffccc7' }}>
            <ExclamationCircleOutlined style={{ marginRight: 8 }} />
            {task.error_message}
          </div>
        )}

        {task.status === 'completed' && (
          <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 24, flexWrap: 'wrap' }}>
            <Space>
              <CheckCircleOutlined style={{ color: '#52c41a', fontSize: 18 }} />
              <Text style={{ color: '#52c41a', fontWeight: 500 }}>处理完成</Text>
              {result?.duration && <Text type="secondary">时长: {result.duration.toFixed(1)}s</Text>}
            </Space>
            <div style={{ marginLeft: 'auto' }}>
              <Space>
                {result?.video_url && (
                  <a href={tasksApi.downloadVideo(task.id)} target="_blank" rel="noopener noreferrer">
                    <Button type="primary" icon={<VideoCameraOutlined />}>下载视频</Button>
                  </a>
                )}
                <a href={tasksApi.download(task.id)} target="_blank" rel="noopener noreferrer">
                  <Button type="primary" style={{ background: '#52c41a', borderColor: '#52c41a' }} icon={<DownloadOutlined />}>下载结果</Button>
                </a>
              </Space>
            </div>
          </div>
        )}

        {result?.full_text && (
          <div style={{ marginTop: 16 }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 8 }}>
              <Text strong>文本预览</Text>
              <Tooltip title={copied ? '已复制' : '复制全文'}>
                <Button
                  size="small"
                  icon={copied ? <CheckOutlined /> : <CopyOutlined />}
                  onClick={() => handleCopy(result.full_text!)}
                >
                  {copied ? '已复制' : '复制全文'}
                </Button>
              </Tooltip>
            </div>
            <div style={{
              background: '#fafafa',
              borderRadius: 8,
              padding: 16,
              fontSize: 14,
              color: '#434343',
              maxHeight: 400,
              overflow: 'auto',
              whiteSpace: 'pre-wrap',
              lineHeight: 1.6,
            }}>
              {result.full_text}
            </div>
          </div>
        )}

        {result?.segments && result.segments.length > 0 && (
          <div style={{ marginTop: 24 }}>
            <Text strong style={{ display: 'block', marginBottom: 8 }}>分段预览</Text>
            <div style={{ maxHeight: 400, overflow: 'auto' }}>
              {result.segments.map((seg) => (
                <div key={seg.id} style={{ background: '#fafafa', borderRadius: 6, padding: 12, marginBottom: 8, fontSize: 13 }}>
                  <Text type="secondary" style={{ fontFamily: 'monospace', fontSize: 12 }}>
                    [{seg.start.toFixed(1)}s - {seg.end.toFixed(1)}s]
                  </Text>
                  <Paragraph style={{ margin: '4px 0 0', color: '#434343' }}>{seg.text}</Paragraph>
                </div>
              ))}
            </div>
          </div>
        )}
      </Card>
    </div>
  )
}
