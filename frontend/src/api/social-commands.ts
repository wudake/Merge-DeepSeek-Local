import request from './client'

export interface SocialMediaCommand {
  id: string
  name: string
  content?: string
  createdAt: string
  updatedAt: string
}

export async function getSocialMediaCommands(keyword?: string): Promise<SocialMediaCommand[]> {
  const params = keyword ? { keyword } : undefined
  return request.get('/social-commands', { params })
}

export async function createSocialMediaCommand(data: { name: string; content?: string }): Promise<SocialMediaCommand> {
  return request.post('/social-commands', data)
}

export async function updateSocialMediaCommand(
  id: string,
  data: { name?: string; content?: string },
): Promise<SocialMediaCommand> {
  return request.patch(`/social-commands/${id}`, data)
}

export async function deleteSocialMediaCommand(id: string): Promise<void> {
  return request.delete(`/social-commands/${id}`)
}
