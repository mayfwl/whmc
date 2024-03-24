import type { AuthRoute } from '@/typings/route'

const aperture: AuthRoute.Route = {
  name: 'aperture',
  path: '/aperture',
  component: () => import('@/views/aperture/index.vue'),
  meta: {
    title: '动态'
  }
}

export default aperture
