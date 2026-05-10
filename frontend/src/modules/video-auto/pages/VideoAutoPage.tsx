import { useEffect, useRef, useState } from 'react'
import { Spin } from 'antd'
import { useAuthStore } from '../../../store/auth'

export default function VideoAutoPage() {
  const token = useAuthStore((s) => s.token)
  const iframeRef = useRef<HTMLIFrameElement>(null)
  const [loading, setLoading] = useState(true)

  const iframeUrl = token
    ? `/video-auto/?token=${encodeURIComponent(token)}`
    : '/video-auto/'

  useEffect(() => {
    const handler = (event: MessageEvent) => {
      if (event.data?.type === 'AUTH_EXPIRED' && event.origin === window.location.origin) {
        const freshToken = useAuthStore.getState().token
        if (freshToken && iframeRef.current) {
          iframeRef.current.src = `/video-auto/?token=${encodeURIComponent(freshToken)}`
        }
      }
    }
    window.addEventListener('message', handler)
    return () => window.removeEventListener('message', handler)
  }, [])

  return (
    <div style={{ width: '100%', height: 'calc(100vh - 112px)', position: 'relative' }}>
      {loading && (
        <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', zIndex: 10 }}>
          <Spin size="large" tip="加载视频自动化工具..." />
        </div>
      )}
      <iframe
        ref={iframeRef}
        src={iframeUrl}
        style={{
          width: '100%',
          height: '100%',
          border: 'none',
          borderRadius: 8,
        }}
        title="视频自动化工具"
        onLoad={() => setLoading(false)}
        sandbox="allow-scripts allow-same-origin allow-forms allow-downloads"
      />
    </div>
  )
}
