import { Component } from 'vue'

declare namespace AuthRoute {
  /**
   * 登录模块
   * - pwd-login: 账密登录
   * - code-login: 手机验证码登录
   * - register: 注册
   * - reset-pwd: 重置密码
   */
  type LoginModule = 'pwd-login' | 'code-login' | 'register' | 'reset-pwd'

  type Route = Pick<
    import('vue-router').RouteRecordRaw,
    path | name | redirect | component | meta | children | props
  >
  /** 前端导入的路由模块 */
  type RouteModule = Record<string, { default: Route }>
  // 路由描叙
  interface RouteMeta {
    title?: string
    icon?: string
    /** 需要登录权限 */
    requiresAuth?: boolean
    /** 缓存页面 */
    keepAlive?: boolean
  }
}
