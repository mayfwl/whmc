import type { AuthRoute } from '@/typings/route'

export const modules = Object.values(
  import.meta.glob('./**/*.ts', { eager: true }) as AuthRoute.RouteModule
).map((m) => m.default as AuthRoute.Route)
