import { useState, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, Form, Input, Select, Button, Typography, Space, message, Radio, Row, Col, Alert } from 'antd'
import { LinkOutlined, AudioOutlined, ApiOutlined, GlobalOutlined, FileTextOutlined, CloudOutlined, InfoCircleOutlined } from '@ant-design/icons'
import { tasksApi } from '../../../api/scripts/tasks'
import { isValidVideoUrl } from '../utils/validation'

const { Title, Text, Paragraph } = Typography

export default function SubmitPage() {
  const navigate = useNavigate()
  const [form] = Form.useForm()
  const [loading, setLoading] = useState(false)
  const [useLocal, setUseLocal] = useState(true)
  const isSubmittingRef = useRef(false)

  const handleSubmit = async (values: any) => {
    if (isSubmittingRef.current) return
    isSubmittingRef.current = true
    setLoading(true)

    if (!isValidVideoUrl(values.url)) {
      message.error('无效的链接，仅支持 Facebook 视频、YouTube 视频和 Facebook Ads Library 链接')
      setLoading(false)
      isSubmittingRef.current = false
      return
    }

    try {
      const res = await tasksApi.create({
        url: values.url,
        language: values.language,
        output_format: values.format,
        use_local: values.useLocal ?? useLocal,
        model_size: values.modelSize || 'tiny',
        device: values.device || 'cpu',
      })
      message.success(`任务已创建: ${res.data.id}`)
      setTimeout(() => navigate(`/scripts/tasks/${res.data.id}`), 800)
    } catch (err: any) {
      message.error(err.response?.data?.detail || '提交失败，请检查链接和后端服务')
    } finally {
      setLoading(false)
      isSubmittingRef.current = false
    }
  }

  return (
    <div style={{ maxWidth: 672, margin: '0 auto' }}>
      <Title level={3} style={{ marginBottom: 4 }}>
        <AudioOutlined style={{ marginRight: 8, color: '#1677ff' }} />
        新建转写任务
      </Title>

      <Text type="secondary" style={{ display: 'block', marginBottom: 24, lineHeight: 1.6 }}>
        粘贴 Facebook、YouTube 或 Facebook Ads Library 视频链接，系统自动下载视频、提取音频并完成语音识别，输出 TXT / SRT / VTT / JSON 格式的文字脚本。支持本地 Whisper 模型（免费）或 OpenAI API（付费）两种转写引擎。
      </Text>

      <Alert
        message="任务并发提醒"
        description="当前服务器同时最多运行 2 个任务，多余任务会自动排队。建议等现有任务完成后再提交新任务，避免长时间等待。"
        type="info"
        showIcon
        icon={<InfoCircleOutlined />}
        style={{ marginBottom: 16, borderRadius: 8 }}
      />

      <Card style={{ borderRadius: 8 }}>
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
          initialValues={{ language: 'en', format: 'json', useLocal: true, modelSize: 'tiny', device: 'cpu' }}
        >
          <Form.Item
            name="url"
            label="视频链接（Facebook / YouTube / Ads Library）"
            rules={[{ required: true, message: '请输入视频链接' }]}
          >
            <Input
              prefix={<LinkOutlined style={{ color: '#bfbfbf' }} />}
              placeholder="Facebook 视频、YouTube 视频，或 facebook.com/ads/library/?id=..."
              size="large"
            />
          </Form.Item>

          <Row gutter={16}>
            <Col xs={24} sm={12}>
              <Form.Item name="language" label={<span><GlobalOutlined style={{ marginRight: 4 }} />语言</span>}>
                <Select size="large">
                  <Select.Option value="auto">自动检测</Select.Option>
                  <Select.Option value="zh">中文</Select.Option>
                  <Select.Option value="en">English</Select.Option>
                  <Select.Option value="ja">日本語</Select.Option>
                  <Select.Option value="ko">한국어</Select.Option>
                  <Select.Option value="es">Español</Select.Option>
                  <Select.Option value="fr">Français</Select.Option>
                </Select>
              </Form.Item>
            </Col>
            <Col xs={24} sm={12}>
              <Form.Item name="format" label={<span><FileTextOutlined style={{ marginRight: 4 }} />输出格式</span>}>
                <Select size="large">
                  <Select.Option value="json">JSON（结构化）</Select.Option>
                  <Select.Option value="txt">TXT（纯文本）</Select.Option>
                  <Select.Option value="srt">SRT（字幕）</Select.Option>
                  <Select.Option value="vtt">VTT（字幕）</Select.Option>
                </Select>
              </Form.Item>
            </Col>
          </Row>

          <Form.Item label="转写引擎">
            <Radio.Group
              value={useLocal}
              onChange={(e) => setUseLocal(e.target.value)}
              buttonStyle="solid"
              size="large"
              style={{ width: '100%' }}
            >
              <Radio.Button value={true} style={{ width: '50%', textAlign: 'center' }}>
                <ApiOutlined /> 本地 Whisper（免费）
              </Radio.Button>
              <Radio.Button value={false} style={{ width: '50%', textAlign: 'center' }}>
                <CloudOutlined /> OpenAI API（付费）
              </Radio.Button>
            </Radio.Group>
          </Form.Item>

          {useLocal && (
            <Row gutter={16}>
              <Col xs={24} sm={12}>
                <Form.Item name="modelSize" label="模型大小">
                  <Select size="large">
                    <Select.Option value="tiny">tiny（最快，准确度低）</Select.Option>
                    <Select.Option value="base">base（快）</Select.Option>
                    <Select.Option value="small">small（平衡）</Select.Option>
                    <Select.Option value="medium">medium（准）</Select.Option>
                    <Select.Option value="large-v3">large-v3（最准，最慢）</Select.Option>
                  </Select>
                </Form.Item>
              </Col>
              <Col xs={24} sm={12}>
                <Form.Item name="device" label="推理设备">
                  <Select size="large">
                    <Select.Option value="cpu">CPU（通用）</Select.Option>
                    <Select.Option value="cuda">CUDA（需 NVIDIA 显卡）</Select.Option>
                  </Select>
                </Form.Item>
              </Col>
            </Row>
          )}

          <Form.Item style={{ marginBottom: 0 }}>
            <Button
              type="primary"
              htmlType="submit"
              loading={loading}
              block
              size="large"
              icon={<AudioOutlined />}
            >
              {loading ? '提交中...' : '开始转写'}
            </Button>
          </Form.Item>
        </Form>
      </Card>
    </div>
  )
}
