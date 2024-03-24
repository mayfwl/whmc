// 保存用户的登录信息、。
import { defineStore } from 'pinia'

import { getUserInfoApi } from '@/service/api/userinfo'

export const useUser = defineStore('user-store', {
  state: () => {
    return {
      user: {} as User.user,
      token: '' as string
    }
  },
  actions: {
    async fetchUserInfo() {
      // 发送一个获取用户名的请求
      const { data } = await getUserInfoApi()

      this.user = data.data
    },

    setToken(token: string) {
      this.token = token
    },
    loginout() {
      // 退出登录
      this.user = {} as User.user
      this.token = ''
    }
  },

  persist: {
    // 持久化存储
    // 在这里进行自定义配置
  }
})
