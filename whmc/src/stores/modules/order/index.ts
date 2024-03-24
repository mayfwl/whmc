import { defineStore } from 'pinia'

import { useUser } from '@/stores/modules/auth'

const useuser = useUser()
// 订单/
export const useOrder = defineStore('order-store', {
  state: () => {
    return {
      order: {
        id: '',
        trail_name: '',
        name: useuser.user.name,
        phone: useuser.user.phone,
        score: 0,
        son: 0,
        trail_img: '',
        perple: 0,
        starttime: 0,
        endtime: 0,
        end: 0,
        act: '',
        scores: 0,
        option: '',
        user_id: useuser.user.id
      } as Trails.ordergoods
    }
  },
  persist: {
    // 持久化存储
    // 在这里进行自定义配置
  }
})
