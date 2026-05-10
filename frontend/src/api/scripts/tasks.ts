import { scriptsApi } from '../client'

export interface TaskCreateRequest {
  url: string
  language?: string
  output_format?: 'txt' | 'srt' | 'vtt' | 'json'
  use_local?: boolean
  model_size?: 'tiny' | 'base' | 'small' | 'medium' | 'large-v3'
  device?: 'cpu' | 'cuda'
}

export interface TaskInfo {
  id: string
  status: 'pending' | 'downloading' | 'extracting_audio' | 'transcribing' | 'completed' | 'failed'
  url: string
  language: string
  output_format: string
  use_local: boolean
  model_size: string
  created_at: string
  updated_at: string | null
  completed_at: string | null
  error_message: string | null
  result_url: string | null
  progress: number
}

export interface TaskResult {
  id: string
  status: string
  language: string | null
  duration: number | null
  segments: Array<{
    id: number
    start: number
    end: number
    text: string
    speaker?: string
  }> | null
  full_text: string | null
  output_file: string | null
  video_url: string | null
  error_message: string | null
}

export const tasksApi = {
  create: (data: TaskCreateRequest) =>
    scriptsApi.post('/tasks', data),
  list: (skip = 0, limit = 20) =>
    scriptsApi.get(`/tasks?skip=${skip}&limit=${limit}`),
  get: (id: string) =>
    scriptsApi.get(`/tasks/${id}`),
  getResult: (id: string) =>
    scriptsApi.get(`/tasks/${id}/result`),
  delete: (id: string) => scriptsApi.delete(`/tasks/${id}`),
  clearAll: () => scriptsApi.delete('/tasks'),
  download: (id: string) => {
    const token = localStorage.getItem('access_token')
    return `/api/scripts/tasks/${id}/download?token=${encodeURIComponent(token || '')}`
  },
  downloadVideo: (id: string) => {
    const token = localStorage.getItem('access_token')
    return `/api/scripts/tasks/${id}/download-video?token=${encodeURIComponent(token || '')}`
  },
}

export function wsUrl(): string {
  const protocol = window.location.protocol === 'https:' ? 'wss:' : 'ws:'
  const host = window.location.host
  const token = localStorage.getItem('access_token') || ''
  return `${protocol}//${host}/ws/tasks?token=${encodeURIComponent(token)}`
}
