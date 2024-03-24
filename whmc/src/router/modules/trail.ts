import type { AuthRoute } from '@/typings/route'

const trail: AuthRoute.Route = {
  name: 'trail',
  path: '/trail',
  component: () => import('@/views/trail/index.vue'),
  meta: {
    title: '营地',
    keepAlive: true
  }
}

export default trail
