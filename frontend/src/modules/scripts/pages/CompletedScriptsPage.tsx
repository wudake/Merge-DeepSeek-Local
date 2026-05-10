import { useEffect, useState } from 'react'
import { Card, Button, Typography, Space, Spin, Empty, Tooltip, message } from 'antd'
import { ReloadOutlined, FileTextOutlined, LinkOutlined, ClockCircleOutlined, CopyOutlined, CheckOutlined } from '@ant-design/icons'
import { tasksApi, type TaskInfo, type TaskResult } from '../../../api/scripts/tasks'

const { Title, Text } = Typography

interface ScriptItem {
  task: TaskInfo
  result: TaskResult | null
}

export default function CompletedScriptsPage() {
  const [items, setItems] = useState<ScriptItem[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [copiedIds, setCopiedIds] = useState<Set<string>>(new Set())

  const handleCopy = async (taskId: string, text: string) => {
    try {
      await navigator.clipboard.writeText(text)
      setCopiedIds((prev) => new Set(prev).add(taskId))
      setTimeout(() => {
        setCopiedIds((prev) => {
          const next = new Set(prev)
          next.delete(taskId)
          return next
        })
      }, 2000)
    } catch {
      const ta = document.createElement('textarea')
      ta.value = text
      document.body.appendChild(ta)
      ta.select()
      document.execCommand('copy')
      document.body.removeChild(ta)
      setCopiedIds((prev) => new Set(prev).add(taskId))
      setTimeout(() => {
        setCopiedIds((prev) => {
          const next = new Set(prev)
          next.delete(taskId)
          return next
        })
      }, 2000)
    }
  }

  const fetchData = async () => {
    setLoading(true)
    setError('')
    try {
      const res = await tasksApi.list(0, 200)
      const completed = res.data.filter((t) => t.status === 'completed')

      const results = await Promise.all(
        completed.map(async (task) => {
          try {
            const r = await tasksApi.getResult(task.id)
            return { task, result: r.data }
          } catch {
            return { task, result: null }
          }
        })
      )

      results.sort((a, b) => {
        const aTime = a.task.completed_at ? new Date(a.task.completed_at).getTime() : 0
        const bTime = b.task.completed_at ? new Date(b.task.completed_at).getTime() : 0
        return bTime - aTime
      })
      setItems(results)
    } catch (err: any) {
      setError(err.response?.data?.detail || '获取数据失败')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchData()
  }, [])

  return (
    <div>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 20 }}>
        <Title level={3} style={{ margin: 0 }}>
          <FileTextOutlined style={{ marginRight: 8, color: '#1677ff' }} />
          已完成视频脚本
        </Title>
        <Button onClick={fetchData} loading={loading} icon={<ReloadOutlined />}>刷新</Button>
      </div>

      {error && (
        <div style={{ background: '#fff2f0', color: '#ff4d4f', padding: '12px 16px', borderRadius: 6, marginBottom: 16, fontSize: 14, border: '1px solid #ffccc7' }}>
          {error}
        </div>
      )}

      {loading && items.length === 0 && (
        <div style={{ textAlign: 'center', padding: 80 }}>
          <Spin size="large" />
        </div>
      )}

      {!loading && items.length === 0 && (
        <Empty description="暂无已完成的视频脚本" style={{ padding: 60 }} />
      )}

      <Space direction="vertical" size={16} style={{ width: '100%' }}>
        {items.map((item) => (
          <Card
            key={item.task.id}
            style={{ borderRadius: 8 }}
            styles={{ body: { padding: 0 } }}
          >
            <div style={{
              padding: '10px 20px',
              background: '#fafafa',
              borderBottom: '1px solid #f0f0f0',
              display: 'flex',
              alignItems: 'center',
              gap: 8,
              borderRadius: '8px 8px 0 0',
            }}>
              <LinkOutlined style={{ color: '#bfbfbf', fontSize: 14 }} />
              <a
                href={item.task.url}
                target="_blank"
                rel="noopener noreferrer"
                style={{ fontSize: 13, color: '#1677ff', flex: 1, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}
                title={item.task.url}
              >
                {item.task.url}
              </a>
              <Space size={16} style={{ flexShrink: 0 }}>
                {item.task.completed_at && (
                  <Text type="secondary" style={{ fontSize: 12 }}>
                    <ClockCircleOutlined style={{ marginRight: 4 }} />
                    {new Date(item.task.completed_at).toLocaleString('zh-CN')}
                  </Text>
                )}
                {item.result?.duration && (
                  <Text type="secondary" style={{ fontSize: 12 }}>
                    {item.result.duration.toFixed(1)}s
                  </Text>
                )}
              </Space>
            </div>
            <div style={{ padding: '16px 20px' }}>
              {item.result?.full_text ? (
                <div style={{ position: 'relative' }}>
                  <div style={{
                    fontSize: 14,
                    color: '#434343',
                    whiteSpace: 'pre-wrap',
                    lineHeight: 1.6,
                    maxHeight: 320,
                    overflow: 'auto',
                    paddingRight: 100,
                  }}>
                    {item.result.full_text}
                  </div>
                  <Tooltip title={copiedIds.has(item.task.id) ? '已复制' : '复制'}>
                    <Button
                      size="small"
                      icon={copiedIds.has(item.task.id) ? <CheckOutlined /> : <CopyOutlined />}
                      onClick={() => handleCopy(item.task.id, item.result!.full_text!)}
                      style={{ position: 'absolute', top: 0, right: 0 }}
                    >
                      {copiedIds.has(item.task.id) ? '已复制' : '复制'}
                    </Button>
                  </Tooltip>
                </div>
              ) : (
                <Text type="secondary" italic>暂无脚本内容</Text>
              )}
            </div>
          </Card>
        ))}
      </Space>
    </div>
  )
}
