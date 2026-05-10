import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Table, Button, Tag, Typography, Space, message, Popconfirm, Progress } from 'antd'
import { ReloadOutlined, ClockCircleOutlined, CheckCircleOutlined, ExclamationCircleOutlined, LoadingOutlined, DeleteOutlined, DownloadOutlined, VideoCameraOutlined } from '@ant-design/icons'
import { tasksApi, type TaskInfo } from '../../../api/scripts/tasks'
import { useWebSocket } from '../hooks/useWebSocket'

const { Title } = Typography

const statusConfig: Record<string, { label: string; color: string; icon: React.ReactNode }> = {
  pending: { label: '等待中', color: 'default', icon: <ClockCircleOutlined /> },
  downloading: { label: '下载中', color: 'processing', icon: <LoadingOutlined /> },
  extracting_audio: { label: '提取音频', color: 'purple', icon: <LoadingOutlined /> },
  transcribing: { label: '识别中', color: 'warning', icon: <LoadingOutlined /> },
  completed: { label: '完成', color: 'success', icon: <CheckCircleOutlined /> },
  failed: { label: '失败', color: 'error', icon: <ExclamationCircleOutlined /> },
}

export default function TasksPage() {
  const [tasks, setTasks] = useState<TaskInfo[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  const fetchTasks = async () => {
    setLoading(true)
    setError('')
    try {
      const res = await tasksApi.list(0, 50)
      setTasks(res.data)
    } catch (err: any) {
      setError(err.response?.data?.detail || '获取任务列表失败')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchTasks()
    const interval = setInterval(fetchTasks, 5000)
    return () => clearInterval(interval)
  }, [])

  useWebSocket((msg) => {
    if (msg.type === 'progress' || msg.type === 'status') {
      setTasks((prev) =>
        prev.map((t) =>
          t.id === msg.task_id
            ? { ...t, progress: msg.progress ?? t.progress, status: (msg.status as any) ?? t.status }
            : t
        )
      )
    }
  })

  const handleDelete = async (taskId: string) => {
    try {
      await tasksApi.delete(taskId)
      setTasks((prev) => prev.filter((t) => t.id !== taskId))
      message.success('删除成功')
    } catch (err: any) {
      message.error(err.response?.data?.detail || '删除任务失败')
    }
  }

  const handleClearAll = async () => {
    try {
      await tasksApi.clearAll()
      setTasks([])
      message.success('已清空全部任务')
    } catch (err: any) {
      message.error(err.response?.data?.detail || '清空任务失败')
    }
  }

  const columns = [
    {
      title: '状态',
      dataIndex: 'status',
      key: 'status',
      width: 100,
      render: (status: string) => {
        const cfg = statusConfig[status] || statusConfig.pending
        return (
          <Tag color={cfg.color} icon={cfg.icon}>
            {cfg.label}
          </Tag>
        )
      },
    },
    {
      title: '链接',
      dataIndex: 'url',
      key: 'url',
      ellipsis: true,
      render: (url: string) => (
        <a href={url} target="_blank" rel="noopener noreferrer" style={{ fontSize: 13 }}>
          {url}
        </a>
      ),
    },
    {
      title: '格式',
      dataIndex: 'output_format',
      key: 'format',
      width: 80,
      render: (v: string) => <span style={{ textTransform: 'uppercase', fontSize: 13 }}>{v}</span>,
    },
    {
      title: '进度',
      dataIndex: 'progress',
      key: 'progress',
      width: 120,
      render: (v: number) => <Progress percent={v} size="small" style={{ minWidth: 80 }} />,
    },
    {
      title: '创建时间',
      dataIndex: 'created_at',
      key: 'created_at',
      width: 160,
      render: (v: string) => (
        <span style={{ fontSize: 13, color: '#8c8c8c' }}>
          {new Date(v).toLocaleString('zh-CN')}
        </span>
      ),
    },
    {
      title: '操作',
      key: 'action',
      width: 240,
      align: 'right' as const,
      render: (_: any, record: TaskInfo) => (
        <Space size={4}>
          <Link to={`/scripts/tasks/${record.id}`}>
            <Button type="link" size="small">详情</Button>
          </Link>
          {record.status === 'completed' && (
            <>
              <a href={tasksApi.downloadVideo(record.id)} target="_blank" rel="noopener noreferrer">
                <Button type="link" size="small" icon={<VideoCameraOutlined />}>视频</Button>
              </a>
              {record.result_url && (
                <a href={tasksApi.download(record.id)} target="_blank" rel="noopener noreferrer">
                  <Button type="link" size="small" icon={<DownloadOutlined />}>字幕</Button>
                </a>
              )}
            </>
          )}
          <Popconfirm title="确定删除？" onConfirm={() => handleDelete(record.id)} okText="删除" okButtonProps={{ danger: true }}>
            <Button type="link" size="small" danger icon={<DeleteOutlined />} />
          </Popconfirm>
        </Space>
      ),
    },
  ]

  return (
    <div>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 20 }}>
        <Title level={3} style={{ margin: 0 }}>任务列表</Title>
        <Space>
          <Popconfirm
            title="确定清空全部任务？"
            description="所有任务数据和文件都会被删除，不可恢复"
            onConfirm={handleClearAll}
            okText="确认清空"
            okButtonProps={{ danger: true }}
          >
            <Button danger icon={<DeleteOutlined />} disabled={loading || tasks.length === 0}>
              清空全部
            </Button>
          </Popconfirm>
          <Button onClick={fetchTasks} loading={loading} icon={<ReloadOutlined />}>刷新</Button>
        </Space>
      </div>

      {error && (
        <div style={{ background: '#fff2f0', color: '#ff4d4f', padding: '12px 16px', borderRadius: 6, marginBottom: 16, fontSize: 14, border: '1px solid #ffccc7' }}>
          {error}
        </div>
      )}

      <Table
        columns={columns}
        dataSource={tasks}
        rowKey="id"
        loading={loading}
        size="middle"
        pagination={false}
        locale={{ emptyText: <span style={{ color: '#bfbfbf' }}>暂无任务，去 <Link to="/scripts/submit">新建任务</Link></span> }}
        style={{ background: '#fff', borderRadius: 8 }}
      />
    </div>
  )
}
