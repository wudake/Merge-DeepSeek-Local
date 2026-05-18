import { scriptsApi } from '../client'

export interface FbAdsResolveResponse {
  video_url: string | null
  kind: 'mp4' | null
}

export const fbAdsApi = {
  resolveVideo: (url: string): Promise<FbAdsResolveResponse> =>
    scriptsApi.post('/fb-ads/resolve-video', { url }).then((r) => r.data),
}
