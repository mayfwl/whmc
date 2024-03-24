import type { AuthRoute } from '@/typings/route'

const creator: AuthRoute.Route = {
  name: 'creator',
  path: '/creator',
  component: () => import('@/views/creator/index.vue'),
  meta: {
    title: '创作中心',
    keepAlive: true
  }
}

export default creator
