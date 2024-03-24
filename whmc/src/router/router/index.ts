import type { RouteLocationNormalized } from 'vue-router'

import { modules } from '@/router/modules/index'
import type { AuthRoute } from '@/typings/route'

/** 根路由: / */
export const ROOT_ROUTE: AuthRoute.Route = {
  name: 'root',
  path: '/',
  component: () => import('@/views/layout/index.vue'),
  redirect: '/home',
  meta: {
    title: 'root'
  },
  children: [...modules]
}

// 固定路由
export const constantRoutes: AuthRoute.Route[] = [
  ROOT_ROUTE,
  {
    name: 'login',
    path: '/login/:module?',
    component: () => import('@/views/login/index.vue'),
    props: (route: RouteLocationNormalized) => {
      const moduleType = (route.params.module as UnionKey.LoginModule) || 'pwd-login'

      return {
        module: moduleType
      }
    },
    meta: {
      title: '登录'
    }
  }
]
