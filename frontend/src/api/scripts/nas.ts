import { scriptsApi } from '../client'

export interface ResolveVideoResponse {
  video_url: string | null
  kind: 'mp4' | 'hls' | null
  mime: string | null
  filename: string | null
  needs_password: boolean
}

export const nasApi = {
  resolveVideo: (url: string): Promise<ResolveVideoResponse> =>
    scriptsApi.post('/nas/resolve-video', { url }).then((r) => r.data),
}
