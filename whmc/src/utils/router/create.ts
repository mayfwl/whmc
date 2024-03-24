import type { RouteRecordRaw } from 'vue-router'

import { constantRoutes } from '@/router/router'

/**
 * Generates a Vue Router configuration based on the views in the '@/views' directory.
 *
 * @return {RouteRecordRaw[]} An array of route records for Vue Router.
 */
export function createvuerouter(): RouteRecordRaw[] {
  console.log(constantRoutes)

  return constantRoutes as RouteRecordRaw[]
}
