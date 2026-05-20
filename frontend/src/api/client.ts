import axios, { AxiosError, AxiosInstance, InternalAxiosRequestConfig } from 'axios'
import { useAuthStore } from '../store/auth'

let isRefreshing = false
let refreshSubscribers: Array<(token: string) => void> = []

function onRefreshed(token: string) {
  refreshSubscribers.forEach((cb) => cb(token))
  refreshSubscribers = []
}

function addRefreshSubscriber(cb: (token: string) => void) {
  refreshSubscribers.push(cb)
}

function clearAuthAndRedirect() {
  localStorage.removeItem('access_token')
  localStorage.removeItem('refresh_token')
  localStorage.removeItem('user')
  useAuthStore.getState().clearAuth()
  window.location.href = '/login'
}

async function tryRefreshToken(
  originalRequest: InternalAxiosRequestConfig,
  instance: AxiosInstance,
) {
  if (isRefreshing) {
    return new Promise((resolve, reject) => {
      addRefreshSubscriber((token: string) => {
        originalRequest.headers.Authorization = `Bearer ${token}`
        resolve(instance(originalRequest))
      })
    })
  }

  isRefreshing = true
  try {
    const refreshTokenValue = localStorage.getItem('refresh_token')
    if (!refreshTokenValue) {
      throw new Error('No refresh token')
    }

    const res = await axios.post('/api/v1/auth/refresh', {
      refreshToken: refreshTokenValue,
    })
    const wrapped = res.data as {
      code?: number
      data?: { accessToken?: string }
      message?: string
    }

    if (wrapped.code !== undefined && wrapped.code !== 200) {
      throw new Error(wrapped.message || 'Refresh failed')
    }

    const newAccessToken = wrapped.data?.accessToken
    if (!newAccessToken) {
      throw new Error('Refresh failed: no access token returned')
    }

    localStorage.setItem('access_token', newAccessToken)
    useAuthStore.getState().setToken(newAccessToken)

    onRefreshed(newAccessToken)
    originalRequest.headers.Authorization = `Bearer ${newAccessToken}`
    return instance(originalRequest)
  } catch (err) {
    clearAuthAndRedirect()
    throw err
  } finally {
    isRefreshing = false
  }
}

function create401Handler(instance: AxiosInstance) {
  return async (error: AxiosError<{ message?: string; detail?: string }>) => {
    const originalRequest = error.config as InternalAxiosRequestConfig & { _retry?: boolean }
    const data = error.response?.data
    const message = data?.message || data?.detail || error.message || '网络错误'

    if (error.response?.status === 401 && originalRequest && !originalRequest._retry) {
      originalRequest._retry = true
      return tryRefreshToken(originalRequest, instance)
    }

    return Promise.reject(new Error(message))
  }
}

const request: AxiosInstance = axios.create({
  baseURL: '/api/v1',
  timeout: 30000,
})

request.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('access_token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => Promise.reject(error),
)

request.interceptors.response.use(
  (response) => {
    const data = response.data
    if (data.code !== undefined && data.code !== 200) {
      return Promise.reject(new Error(data.message || '请求失败'))
    }
    return data.data ?? data
  },
  create401Handler(request),
)

export const scriptsApi = axios.create({
  baseURL: '/api/scripts',
  timeout: 30000,
})

scriptsApi.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('access_token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => Promise.reject(error),
)

scriptsApi.interceptors.response.use(
  (response) => response,
  create401Handler(scriptsApi),
)

export default request
