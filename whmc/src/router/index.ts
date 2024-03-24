import type { App } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'

import { createvuerouter } from '@/utils'
import { createRouterGuard } from './guard'

export const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: createvuerouter()
})

/** setup vue router. - [安装vue路由] */
export async function setupRouter(app: App) {
  app.use(router)
  createRouterGuard(router)
  await router.isReady()
}

export * from './router'
export * from './modules'
