import { useState, useEffect } from 'react'
import { Outlet, useNavigate, useLocation } from 'react-router-dom'
import { Layout, Menu, Typography, Button, Grid, Drawer } from 'antd'
import {
  AccountBookOutlined,
  FileTextOutlined,
  DatabaseOutlined,
  SettingOutlined,
  LogoutOutlined,
  VideoCameraOutlined,
  AudioOutlined,
  MenuOutlined,
} from '@ant-design/icons'
import type { MenuProps } from 'antd'
import { useAuthStore } from '../store/auth'

const { Header, Content } = Layout
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
  {
    key: '/video-auto',
    icon: <VideoCameraOutlined />,
    label: '视频自动化',
  },
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
  const { clearAuth } = useAuthStore()
  const screens = Grid.useBreakpoint()
  const isMobile = !screens.md

  const [drawerOpen, setDrawerOpen] = useState(false)
  const [mounted, setMounted] = useState(false)
  useEffect(() => {
    setMounted(true)
  }, [])

  const handleMenuClick: MenuProps['onClick'] = (e) => {
    navigate(e.key)
    setDrawerOpen(false)
  }

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Header
        style={{
          position: 'sticky',
          top: 0,
          zIndex: 1000,
          background: '#fff',
          padding: isMobile ? '0 12px' : '0 24px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          boxShadow: '0 1px 4px rgba(0,0,0,0.05)',
          gap: 12,
        }}
      >
        {/* 左侧 Logo + 标题 */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, flexShrink: 0 }}>
          <img
            src="/boswindor-logo.png"
            alt="Boswindor"
            style={{ height: 32 }}
          />
          {mounted && !isMobile && (
            <Text strong style={{ fontSize: 16, whiteSpace: 'nowrap' }}>
              Boswindor运营管理平台
            </Text>
          )}
        </div>

        {/* 中间 导航 */}
        {mounted && isMobile ? (
          <Button
            type="text"
            icon={<MenuOutlined />}
            onClick={() => setDrawerOpen(true)}
          />
        ) : (
          <Menu
            mode="horizontal"
            selectedKeys={[getSelectedKey(location.pathname)]}
            items={menuItems}
            onClick={handleMenuClick}
            style={{
              flex: 1,
              borderBottom: 0,
              justifyContent: 'center',
              background: 'transparent',
              minWidth: 0,
            }}
          />
        )}

        {/* 右侧 退出登录 */}
        <Button
          type="text"
          danger
          icon={<LogoutOutlined />}
          onClick={() => {
            clearAuth()
            navigate('/login')
          }}
          style={{ flexShrink: 0 }}
        >
          {mounted && !isMobile ? '退出登录' : ''}
        </Button>
      </Header>

      {/* 移动端抽屉导航 */}
      <Drawer
        title="菜单"
        placement="right"
        onClose={() => setDrawerOpen(false)}
        open={drawerOpen}
        width={220}
        bodyStyle={{ padding: 0 }}
      >
        <Menu
          mode="inline"
          selectedKeys={[getSelectedKey(location.pathname)]}
          items={menuItems}
          onClick={handleMenuClick}
          style={{ borderRight: 0 }}
        />
      </Drawer>

      <Content
        style={{
          margin: isMobile ? 12 : 24,
          padding: isMobile ? 12 : 24,
          background: '#fff',
          borderRadius: 8,
        }}
      >
        <Outlet />
      </Content>
    </Layout>
  )
}
