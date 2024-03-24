import type { AuthRoute } from '@/typings/route'

const map: AuthRoute.Route = {
  name: 'map',
  path: '/map',
  component: () => import('@/views/map/index.vue'),
  meta: {
    title: '地图'
  }
}

export default map
