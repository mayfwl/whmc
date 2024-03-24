import type { AuthRoute } from '@/typings/route'

const home: AuthRoute.Route = {
  name: 'home',
  path: '/home',
  component: () => import('@/views/home/index.vue'),
  meta: {
    title: '首页'
  }
}

export default home
