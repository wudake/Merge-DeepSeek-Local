import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest'
import { render, screen, waitFor, within } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import SocialCommandsPage from './index'
import * as api from '../../../../api/social-commands'

// Mock MDEditor to avoid heavy markdown editor loading in tests
vi.mock('@uiw/react-md-editor', () => {
  const MockMarkdown = ({ source }: any) => <div data-testid="md-preview">{source}</div>
  const MockEditor = ({ value, onChange }: any) => (
    <textarea
      data-testid="md-editor"
      value={value || ''}
      onChange={(e) => onChange?.(e.target.value)}
    />
  )
  MockEditor.Markdown = MockMarkdown
  return {
    default: MockEditor,
    __esModule: true,
  }
})

vi.mock('../../../../api/social-commands', () => ({
  getSocialMediaCommands: vi.fn(),
  createSocialMediaCommand: vi.fn(),
  updateSocialMediaCommand: vi.fn(),
  deleteSocialMediaCommand: vi.fn(),
}))

describe('SocialCommandsPage', () => {
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
    vi.clearAllMocks()
    vi.mocked(api.getSocialMediaCommands).mockResolvedValue(mockItems)
    vi.mocked(api.createSocialMediaCommand).mockResolvedValue({
      ...mockItems[0],
      id: 'cmd-new',
    })
    vi.mocked(api.updateSocialMediaCommand).mockResolvedValue(mockItems[0])
    vi.mocked(api.deleteSocialMediaCommand).mockResolvedValue(undefined)
  })

  afterEach(() => {
    vi.restoreAllMocks()
  })

  it('should render page title and table', async () => {
    render(<SocialCommandsPage />)

    expect(screen.getByText('社媒指令')).toBeInTheDocument()
    await waitFor(() => {
      expect(screen.getByText('抖音带货脚本')).toBeInTheDocument()
    })
    expect(screen.getByText('小红书种草文案')).toBeInTheDocument()
  })

  it('should fetch items on mount', async () => {
    render(<SocialCommandsPage />)

    await waitFor(() => {
      expect(api.getSocialMediaCommands).toHaveBeenCalledWith(undefined)
    })
  })

  it('should search by keyword and refetch', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    const searchInput = screen.getByPlaceholderText('搜索指令名称')
    await user.type(searchInput, '抖音')
    await user.click(screen.getByRole('button', { name: '查 询' }))

    await waitFor(() => {
      expect(api.getSocialMediaCommands).toHaveBeenLastCalledWith('抖音')
    })
  })

  it('should open create modal and submit new command', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    await user.click(screen.getByRole('button', { name: 'plus新增指令' }))

    expect(screen.getByText('新增社媒指令')).toBeInTheDocument()

    const nameInput = screen.getByPlaceholderText('输入社媒指令名称')
    await user.type(nameInput, '新指令')

    const editor = screen.getByTestId('md-editor')
    await user.clear(editor)
    await user.type(editor, '# 新内容')

    await user.click(screen.getByRole('button', { name: 'OK' }))

    await waitFor(() => {
      expect(api.createSocialMediaCommand).toHaveBeenCalledWith({
        name: '新指令',
        content: '# 新内容',
      })
    })
  })

  it('should open edit modal with pre-filled data', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    const editBtn = screen.getAllByRole('button', { name: 'edit' })[0]
    await user.click(editBtn)

    expect(screen.getByText('编辑社媒指令')).toBeInTheDocument()

    const nameInput = screen.getByPlaceholderText('输入社媒指令名称') as HTMLInputElement
    expect(nameInput.value).toBe('抖音带货脚本')

    const editor = screen.getByTestId('md-editor') as HTMLTextAreaElement
    expect(editor.value).toBe('# 脚本\n1. 钩子')
  })

  it('should submit update when editing', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    const editBtn = screen.getAllByRole('button', { name: 'edit' })[0]
    await user.click(editBtn)

    const nameInput = screen.getByPlaceholderText('输入社媒指令名称')
    await user.clear(nameInput)
    await user.type(nameInput, '更新后名称')

    await user.click(screen.getByRole('button', { name: 'OK' }))

    await waitFor(() => {
      expect(api.updateSocialMediaCommand).toHaveBeenCalledWith('cmd-1', {
        name: '更新后名称',
        content: '# 脚本\n1. 钩子',
      })
    })
  })

  it('should open preview modal', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    const previewBtn = screen.getAllByRole('button', { name: 'eye' })[0]
    await user.click(previewBtn)

    // Modal title contains the command name
    expect(screen.getAllByText('抖音带货脚本').length).toBeGreaterThanOrEqual(1)
    expect(screen.getByTestId('md-preview')).toHaveTextContent('# 脚本 1. 钩子')

    await user.click(screen.getByRole('button', { name: '关 闭' }))
  })

  it('should delete item after confirmation', async () => {
    const user = userEvent.setup()
    render(<SocialCommandsPage />)

    await waitFor(() => screen.getByText('抖音带货脚本'))

    const deleteBtn = screen.getAllByRole('button', { name: 'delete' })[0]
    await user.click(deleteBtn)

    // Ant Design Popconfirm renders its content in document.body
    await waitFor(() => {
      expect(screen.getByText('确认删除')).toBeInTheDocument()
    })

    const confirmBtn = screen.getByRole('button', { name: /Yes|确定|OK/ })
    await user.click(confirmBtn)

    await waitFor(() => {
      expect(api.deleteSocialMediaCommand).toHaveBeenCalledWith('cmd-1')
    })
  })

  it('should show empty table when no data', async () => {
    vi.mocked(api.getSocialMediaCommands).mockResolvedValue([])
    render(<SocialCommandsPage />)

    await waitFor(() => {
      expect(screen.queryByText('抖音带货脚本')).not.toBeInTheDocument()
    })
    expect(screen.getByText('社媒指令')).toBeInTheDocument()
  })
})
