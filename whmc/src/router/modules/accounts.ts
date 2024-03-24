import type { AuthRoute } from '@/typings/route'

const accounts: AuthRoute.Route = {
  name: 'accounts',
  path: '/accounts',
  component: () => import('@/views/accounts/index.vue'),
  meta: {
    title: '结算'
  }
}

export default accounts
