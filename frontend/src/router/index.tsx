import { RouteObject, Navigate } from 'react-router-dom'
import ProtectedRoute from '../components/ProtectedRoute'
import ShellLayout from '../components/ShellLayout'
import LoginPage from '../modules/auth/pages/LoginPage'

// Operations pages
import DashboardPage from '../modules/operations/pages/Dashboard'
import AccountListPage from '../modules/operations/pages/Accounts'
import ContentCalendarPage from '../modules/operations/pages/Contents'
import TopicListPage from '../modules/operations/pages/Topics'
import SettingsPage from '../modules/operations/pages/Settings'

// Scripts pages
import SubmitPage from '../modules/scripts/pages/SubmitPage'
import TasksPage from '../modules/scripts/pages/TasksPage'
import TaskDetailPage from '../modules/scripts/pages/TaskDetailPage'
import CompletedScriptsPage from '../modules/scripts/pages/CompletedScriptsPage'

// Video Auto (iframe)
import VideoAutoPage from '../modules/video-auto/pages/VideoAutoPage'

export const routes: RouteObject[] = [
  { path: '/login', element: <LoginPage /> },
  {
    path: '/',
    element: (
      <ProtectedRoute>
        <ShellLayout />
      </ProtectedRoute>
    ),
    children: [
      { index: true, element: <Navigate to="/operations/dashboard" replace /> },

      // Operations module
      { path: 'operations/dashboard', element: <DashboardPage /> },
      { path: 'operations/accounts', element: <AccountListPage /> },
      { path: 'operations/contents', element: <ContentCalendarPage /> },
      { path: 'operations/topics', element: <TopicListPage /> },

      // Scripts module
      { path: 'scripts/submit', element: <SubmitPage /> },
      { path: 'scripts/tasks', element: <TasksPage /> },
      { path: 'scripts/tasks/:taskId', element: <TaskDetailPage /> },
      { path: 'scripts/completed', element: <CompletedScriptsPage /> },

      // Video Auto (iframe)
      { path: 'video-auto', element: <VideoAutoPage /> },

      // Settings
      { path: 'settings', element: <SettingsPage /> },
    ],
  },
]
