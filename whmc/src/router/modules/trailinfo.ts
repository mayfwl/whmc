import type { AuthRoute } from '@/typings/route'

const trailinfo: AuthRoute.Route = {
  name: 'trailinfo',
  path: '/trailinfo/:name',
  component: () => import('@/views/trailinfo/index.vue'),
  meta: {
    title: '营地详情页面'
  }
}

export default trailinfo
