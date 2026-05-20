import { useState, useEffect, useCallback } from 'react'
import {
  Table, Button, Input, Space, Modal, Form,
  message, Popconfirm, Card, Row, Col, Grid, Tooltip,
} from 'antd'
import {
  PlusOutlined, SearchOutlined, EditOutlined, DeleteOutlined, EyeOutlined,
} from '@ant-design/icons'
import MDEditor from '@uiw/react-md-editor'
import {
  getSocialMediaCommands,
  createSocialMediaCommand,
  updateSocialMediaCommand,
  deleteSocialMediaCommand,
  type SocialMediaCommand,
} from '../../../../api/social-commands'
import dayjs from 'dayjs'

export default function SocialCommandsPage() {
  const [items, setItems] = useState<SocialMediaCommand[]>([])
  const [loading, setLoading] = useState(false)
  const [modalVisible, setModalVisible] = useState(false)
  const [previewVisible, setPreviewVisible] = useState(false)
  const [previewFullscreen, setPreviewFullscreen] = useState(false)
  const [previewItem, setPreviewItem] = useState<SocialMediaCommand | null>(null)
  const [editingItem, setEditingItem] = useState<SocialMediaCommand | null>(null)
  const [searchText, setSearchText] = useState('')
  const [form] = Form.useForm()
  const screens = Grid.useBreakpoint()
  const isMobile = !screens.md

  const fetchItems = useCallback(async () => {
    setLoading(true)
    try {
      const data = await getSocialMediaCommands(searchText || undefined)
      setItems(data)
    } finally {
      setLoading(false)
    }
  }, [searchText])

  useEffect(() => {
    fetchItems()
  }, [fetchItems])

  const handleSubmit = async (values: any) => {
    try {
      const payload = {
        name: values.name,
        content: values.content || undefined,
      }
      if (editingItem) {
        await updateSocialMediaCommand(editingItem.id, payload)
        message.success('更新成功')
      } else {
        await createSocialMediaCommand(payload)
        message.success('创建成功')
      }
      setModalVisible(false)
      setEditingItem(null)
      form.resetFields()
      fetchItems()
    } catch (err: any) {
      message.error(err.message || '操作失败')
    }
  }

  const handleDelete = async (id: string) => {
    try {
      await deleteSocialMediaCommand(id)
      message.success('删除成功')
      fetchItems()
    } catch (err: any) {
      message.error(err.message || '删除失败')
    }
  }

  const openEdit = (item: SocialMediaCommand) => {
    setEditingItem(item)
    form.setFieldsValue({
      name: item.name,
      content: item.content || '',
    })
    setModalVisible(true)
  }

  const openCreate = () => {
    setEditingItem(null)
    form.resetFields()
    setModalVisible(true)
  }

  const openPreview = (item: SocialMediaCommand) => {
    setPreviewItem(item)
    setPreviewVisible(true)
  }

  const columns = [
    {
      title: '名称',
      dataIndex: 'name',
      key: 'name',
      ellipsis: true,
    },
    {
      title: '创建时间',
      dataIndex: 'createdAt',
      key: 'createdAt',
      width: 160,
      render: (v: string) => (v ? dayjs(v).format('YYYY-MM-DD HH:mm') : '-'),
    },
    {
      title: '更新时间',
      dataIndex: 'updatedAt',
      key: 'updatedAt',
      width: 160,
      render: (v: string) => (v ? dayjs(v).format('YYYY-MM-DD HH:mm') : '-'),
    },
    {
      title: '操作',
      key: 'action',
      width: 120,
      align: 'center' as const,
      render: (_: any, record: SocialMediaCommand) => (
        <Space>
          <Tooltip title="预览">
            <Button
              type="link"
              icon={<EyeOutlined />}
              onClick={() => openPreview(record)}
            />
          </Tooltip>
          <Tooltip title="编辑">
            <Button
              type="link"
              icon={<EditOutlined />}
              onClick={() => openEdit(record)}
            />
          </Tooltip>
          <Popconfirm
            title="确认删除"
            description="删除后不可恢复，是否继续？"
            onConfirm={() => handleDelete(record.id)}
          >
            <Button type="link" danger icon={<DeleteOutlined />} />
          </Popconfirm>
        </Space>
      ),
    },
  ]

  return (
    <div>
      <h2 style={{ marginTop: 0 }}>社媒指令</h2>

      <Card style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col>
            <Input
              placeholder="搜索指令名称"
              prefix={<SearchOutlined />}
              value={searchText}
              onChange={(e) => setSearchText(e.target.value)}
              onPressEnter={fetchItems}
              style={{ width: isMobile ? '100%' : 240 }}
            />
          </Col>
          <Col>
            <Button type="primary" onClick={fetchItems}>查询</Button>
          </Col>
          <Col style={{ marginLeft: 'auto' }}>
            <Button type="primary" icon={<PlusOutlined />} onClick={openCreate}>
              新增指令
            </Button>
          </Col>
        </Row>
      </Card>

      <Table
        columns={columns}
        dataSource={items}
        rowKey="id"
        loading={loading}
        size="small"
        pagination={{ pageSize: 50 }}
        scroll={{ x: isMobile ? 600 : undefined }}
      />

      {/* 编辑/新建 Modal */}
      <Modal
        title={editingItem ? '编辑社媒指令' : '新增社媒指令'}
        open={modalVisible}
        onOk={() => form.submit()}
        onCancel={() => {
          setModalVisible(false)
          setEditingItem(null)
          form.resetFields()
        }}
        width={isMobile ? '95%' : 720}
        destroyOnClose
      >
        <Form form={form} layout="vertical" onFinish={handleSubmit}>
          <Form.Item
            name="name"
            label="指令名称"
            rules={[{ required: true, message: '请输入指令名称' }]}
          >
            <Input placeholder="输入社媒指令名称" />
          </Form.Item>
          <Form.Item
            name="content"
            label="指令内容（支持 Markdown）"
          >
            <MDEditor
              height={360}
              visibleDragbar={false}
              data-color-mode="light"
            />
          </Form.Item>
        </Form>
      </Modal>

      {/* 预览 Modal */}
      <Modal
        title={
          <Space>
            <span>{previewItem?.name || '预览'}</span>
            {!isMobile && (
              <Button
                type="link"
                size="small"
                onClick={() => setPreviewFullscreen((v) => !v)}
              >
                {previewFullscreen ? '退出全屏' : '全屏'}
              </Button>
            )}
          </Space>
        }
        open={previewVisible}
        onOk={() => setPreviewVisible(false)}
        onCancel={() => {
          setPreviewVisible(false)
          setPreviewFullscreen(false)
        }}
        width={isMobile ? '95%' : previewFullscreen ? '95%' : 960}
        style={{ maxWidth: previewFullscreen ? '100%' : undefined }}
        styles={{
          body: {
            maxHeight: '80vh',
            overflow: 'auto',
            padding: isMobile ? '12px 16px' : '20px 28px',
          },
        }}
        footer={[
          <Button key="close" type="primary" onClick={() => setPreviewVisible(false)}>
            关闭
          </Button>,
        ]}
        destroyOnClose
      >
        {previewItem?.content ? (
          <MDEditor.Markdown
            source={previewItem.content}
            style={{
              background: 'transparent',
              lineHeight: 1.8,
              fontSize: 15,
            }}
          />
        ) : (
          <div style={{ color: '#999', textAlign: 'center', padding: 40 }}>
            暂无内容
          </div>
        )}
      </Modal>
    </div>
  )
}
