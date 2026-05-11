import { useState, useEffect } from 'react'
import { Outlet, useNavigate, useLocation } from 'react-router-dom'
import { Layout, Menu, Avatar, Dropdown, Typography, Button, Grid } from 'antd'
import {
  DashboardOutlined,
  AccountBookOutlined,
  FileTextOutlined,
  DatabaseOutlined,
  SettingOutlined,
  LogoutOutlined,
  UserOutlined,
  MenuFoldOutlined,
  MenuUnfoldOutlined,
  VideoCameraOutlined,
  AudioOutlined,
} from '@ant-design/icons'
import type { MenuProps } from 'antd'
import { useAuthStore } from '../store/auth'

const { Header, Sider, Content } = Layout
const { Text } = Typography

type MenuItem = Required<MenuProps>['items'][number]

const menuItems: MenuItem[] = [
  {
    key: '/operations/accounts',
    icon: <AccountBookOutlined />,
    label: '账号管理',
  },
  {
    key: '/operations/contents',
    icon: <FileTextOutlined />,
    label: '内容产出',
  },
  {
    key: '/operations/topics',
    icon: <DatabaseOutlined />,
    label: '选题库',
  },
  { type: 'divider' },
  {
    key: '/scripts/submit',
    icon: <AudioOutlined />,
    label: '视频脚本提取',
  },
  {
    key: '/scripts/tasks',
    icon: <FileTextOutlined />,
    label: '提取任务列表',
  },
  {
    key: '/scripts/completed',
    icon: <FileTextOutlined />,
    label: '已完成脚本',
  },
  { type: 'divider' },
  {
    key: '/video-auto',
    icon: <VideoCameraOutlined />,
    label: '视频自动化',
  },
  { type: 'divider' },
  {
    key: '/settings',
    icon: <SettingOutlined />,
    label: '系统设置',
  },
]

function getSelectedKey(pathname: string): string {
  if (pathname.startsWith('/operations/accounts')) return '/operations/accounts'
  if (pathname.startsWith('/operations/contents')) return '/operations/contents'
  if (pathname.startsWith('/operations/topics')) return '/operations/topics'
  if (pathname.startsWith('/scripts/submit')) return '/scripts/submit'
  if (pathname.startsWith('/scripts/tasks')) return '/scripts/tasks'
  if (pathname.startsWith('/scripts/completed')) return '/scripts/completed'
  if (pathname.startsWith('/video-auto')) return '/video-auto'
  if (pathname.startsWith('/settings')) return '/settings'
  return '/operations/contents'
}

export default function ShellLayout() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user, clearAuth } = useAuthStore()
  const screens = Grid.useBreakpoint()
  const isMobile = !screens.md
  const [collapsed, setCollapsed] = useState(false)

  useEffect(() => {
    if (isMobile) setCollapsed(true)
  }, [isMobile])

  const handleMenuClick: MenuProps['onClick'] = (e) => navigate(e.key)

  const userMenuItems: MenuProps['items'] = [
    {
      key: 'profile',
      icon: <UserOutlined />,
      label: user?.realName || user?.username || '用户',
      disabled: true,
    },
    { type: 'divider' },
    {
      key: 'logout',
      icon: <LogoutOutlined />,
      label: '退出登录',
      danger: true,
    },
  ]

  const handleUserMenuClick: MenuProps['onClick'] = ({ key }) => {
    if (key === 'logout') {
      clearAuth()
      navigate('/login')
    }
  }

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Sider
        theme="light"
        width={220}
        collapsed={collapsed}
        collapsedWidth={0}
        trigger={null}
        style={{ boxShadow: '2px 0 8px rgba(0,0,0,0.05)' }}
      >
        <div style={{
          height: 64,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          borderBottom: '1px solid #f0f0f0',
        }}>
          <Text strong style={{ fontSize: 16, whiteSpace: 'nowrap' }}>Boswindor运营管理平台</Text>
        </div>
        <Menu
          mode="inline"
          selectedKeys={[getSelectedKey(location.pathname)]}
          items={menuItems}
          onClick={handleMenuClick}
          style={{ borderRight: 0 }}
        />
      </Sider>
      <Layout>
        <Header style={{
          background: '#fff',
          padding: '0 24px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          boxShadow: '0 1px 4px rgba(0,0,0,0.05)',
        }}>
          <Button
            type="text"
            icon={collapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />}
            onClick={() => setCollapsed(!collapsed)}
          />
          <img
            src="/boswindor-logo.png"
            alt="Boswindor"
            style={{ height: 36 }}
          />
        </Header>
        <Content style={{ margin: isMobile ? 12 : 24, padding: isMobile ? 12 : 24, background: '#fff', borderRadius: 8 }}>
          <Outlet />
        </Content>
      </Layout>
    </Layout>
  )
}
