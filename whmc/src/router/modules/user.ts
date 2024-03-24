import type { AuthRoute } from '@/typings/route'

const user: AuthRoute.Route = {
  name: 'user',
  path: '/user',
  component: () => import('@/views/user/index.vue'),
  redirect: '/user/likes',
  meta: {
    title: '个人中心'
  },
  children: [
    {
      name: 'works',
      path: '/user/works',
      meta: {
        title: '作品'
      },
      component: () => import('@/views/user/components/works/index.vue')
    },
    {
      name: 'likes',
      path: '/user/likes',
      meta: {
        title: '喜欢'
      },
      component: () => import('@/views/user/components/likes/index.vue')
    },
    {
      name: 'makes',
      path: '/user/makes',
      meta: {
        title: '预约'
      },
      component: () => import('@/views/user/components/makes/index.vue')
    },
    {
      name: 'makeshistory',
      path: '/user/makeshistory',
      meta: {
        title: '预约历史'
      },
      component: () => import('@/views/user/components/makeshistory/index.vue')
    }
  ]
}

export default user
