import { useState } from 'react'
import { Server, Save, CheckCircle2 } from 'lucide-react'

export default function SettingsPage() {
  const [apiBaseUrl, setApiBaseUrl] = useState(localStorage.getItem('api_base_url') || '')
  const [saved, setSaved] = useState(false)

  const handleSave = () => {
    localStorage.setItem('api_base_url', apiBaseUrl.trim())
    setSaved(true)
    setTimeout(() => setSaved(false), 2000)
  }

  return (
    <div className="max-w-2xl mx-auto p-6">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">脚本提取设置</h1>
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <div className="flex items-center gap-2 mb-4">
          <Server className="w-5 h-5 text-gray-500" />
          <label className="block text-sm font-medium text-gray-700">API 地址（可选）</label>
        </div>
        <input
          type="text"
          value={apiBaseUrl}
          onChange={(e) => setApiBaseUrl(e.target.value)}
          placeholder="默认使用 /api/scripts"
          className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        />
        <p className="mt-1 text-xs text-gray-500">留空则使用默认地址。认证已通过统一 JWT 处理，无需配置 API Key。</p>
        <button
          onClick={handleSave}
          className="mt-4 inline-flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors text-sm font-medium"
        >
          {saved ? <CheckCircle2 className="w-4 h-4" /> : <Save className="w-4 h-4" />}
          {saved ? '已保存' : '保存设置'}
        </button>
      </div>
    </div>
  )
}
