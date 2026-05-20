import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest'
import MockAdapter from 'axios-mock-adapter'
import request from './client'
import {
  getSocialMediaCommands,
  createSocialMediaCommand,
  updateSocialMediaCommand,
  deleteSocialMediaCommand,
} from './social-commands'

describe('social-commands API client', () => {
  let mock: MockAdapter

  const mockItems = [
    {
      id: 'cmd-1',
      name: '抖音带货脚本',
      content: '# 脚本\n1. 钩子',
      createdAt: '2026-05-18T08:00:00Z',
      updatedAt: '2026-05-18T09:00:00Z',
    },
    {
      id: 'cmd-2',
      name: '小红书种草文案',
      content: '## 文案\n- 痛点',
      createdAt: '2026-05-17T08:00:00Z',
      updatedAt: '2026-05-17T10:00:00Z',
    },
  ]

  beforeEach(() => {
    mock = new MockAdapter(request)
  })

  afterEach(() => {
    mock.restore()
  })

  describe('getSocialMediaCommands', () => {
    it('should fetch all commands without keyword', async () => {
      mock.onGet('/social-commands').reply(200, {
        code: 200,
        message: 'success',
        data: mockItems,
      })

      const result = await getSocialMediaCommands()

      expect(result).toEqual(mockItems)
      expect(mock.history.get[0].url).toBe('/social-commands')
      expect(mock.history.get[0].params).toBeUndefined()
    })

    it('should fetch commands with keyword filter', async () => {
      mock.onGet('/social-commands').reply(200, {
        code: 200,
        message: 'success',
        data: [mockItems[0]],
      })

      const result = await getSocialMediaCommands('抖音')

      expect(result).toHaveLength(1)
      expect(result[0].name).toBe('抖音带货脚本')
      expect(mock.history.get[0].params).toEqual({ keyword: '抖音' })
    })

    it('should handle empty response', async () => {
      mock.onGet('/social-commands').reply(200, {
        code: 200,
        message: 'success',
        data: [],
      })

      const result = await getSocialMediaCommands()

      expect(result).toEqual([])
    })

    it('should throw on API error', async () => {
      mock.onGet('/social-commands').reply(500, {
        code: 500,
        message: '服务器内部错误',
      })

      await expect(getSocialMediaCommands()).rejects.toThrow('服务器内部错误')
    })
  })

  describe('createSocialMediaCommand', () => {
    it('should create command with name and content', async () => {
      const payload = { name: '新指令', content: '# 新内容' }
      mock.onPost('/social-commands').reply(200, {
        code: 200,
        message: 'success',
        data: { id: 'cmd-new', ...payload, createdAt: '2026-05-18T10:00:00Z', updatedAt: '2026-05-18T10:00:00Z' },
      })

      const result = await createSocialMediaCommand(payload)

      expect(result.name).toBe('新指令')
      expect(result.content).toBe('# 新内容')
      expect(JSON.parse(mock.history.post[0].data)).toEqual(payload)
    })

    it('should create command without content', async () => {
      const payload = { name: '仅名称' }
      mock.onPost('/social-commands').reply(200, {
        code: 200,
        message: 'success',
        data: { id: 'cmd-new', ...payload, content: undefined, createdAt: '2026-05-18T10:00:00Z', updatedAt: '2026-05-18T10:00:00Z' },
      })

      const result = await createSocialMediaCommand(payload)

      expect(result.name).toBe('仅名称')
    })

    it('should throw on validation error', async () => {
      mock.onPost('/social-commands').reply(400, {
        code: 400,
        message: 'name should not be empty',
      })

      await expect(createSocialMediaCommand({ name: '', content: '' })).rejects.toThrow(
        'name should not be empty',
      )
    })
  })

  describe('updateSocialMediaCommand', () => {
    it('should update command with partial data', async () => {
      const payload = { name: '更新后名称' }
      mock.onPatch('/social-commands/cmd-1').reply(200, {
        code: 200,
        message: 'success',
        data: { ...mockItems[0], ...payload },
      })

      const result = await updateSocialMediaCommand('cmd-1', payload)

      expect(result.name).toBe('更新后名称')
      expect(result.id).toBe('cmd-1')
      expect(JSON.parse(mock.history.patch[0].data)).toEqual(payload)
    })

    it('should throw on 404', async () => {
      mock.onPatch('/social-commands/unknown').reply(404, {
        code: 404,
        message: '社媒指令不存在',
      })

      await expect(updateSocialMediaCommand('unknown', { name: 'X' })).rejects.toThrow(
        '社媒指令不存在',
      )
    })
  })

  describe('deleteSocialMediaCommand', () => {
    it('should delete command by id', async () => {
      mock.onDelete('/social-commands/cmd-1').reply(200, {
        code: 200,
        message: 'success',
        data: mockItems[0],
      })

      const result = await deleteSocialMediaCommand('cmd-1')

      expect(result).toEqual(mockItems[0])
    })

    it('should throw on 404', async () => {
      mock.onDelete('/social-commands/unknown').reply(404, {
        code: 404,
        message: '社媒指令不存在',
      })

      await expect(deleteSocialMediaCommand('unknown')).rejects.toThrow('社媒指令不存在')
    })
  })
})
