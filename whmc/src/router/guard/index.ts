// 路由守卫
import type { RouteLocationNormalized, NavigationGuardNext } from 'vue-router'
import type { Router } from 'vue-router'

import { useUser } from '@/stores/modules/auth/index'

/**
 * 路由守卫函数
 * @param router - 路由实例
 */

// sez验证token的页面
const whiteList = [
  '/login',
  '/login/pwd-login',
  '/login/code-login',
  '/login/register',
  '/login/reset-pwd',
  '/home'
]
export function createRouterGuard(router: Router) {
  router.beforeEach(
    async (
      to: RouteLocationNormalized,
      from: RouteLocationNormalized,
      next: NavigationGuardNext
    ) => {
      const User = useUser()
      const token = User.token

      if (token) {
        // 如果有token, 证明已登录
        if (!User.user.name) {
          // 有token没有用户信息，重新获取用户信息
          User.fetchUserInfo()
        }
        next() // 路由放行
      } else {
        // 如果无token，先判断是否在白名单
        if (whiteList.includes(to.path)) {
          next()
        } else {
          // 如果其他页面跳转到登录页面
          next('/login')
        }
      }
    }
  )
}
