import { defineStore } from 'pinia'

// 日期
const now = new Date() // 获取当前日期和时间
const tomorrow = new Date(now) // 创建一个新的 Date 对象，复制当前日期
tomorrow.setDate(now.getDate() + 1) // 将日期设置为当前日期加一天
// 保存用户订单的信息
export const useTrailStore = defineStore('trailinfo-store', {
  state: () => {
    return {
      range: [now.getTime(), tomorrow.getTime()] as [number, number],
      popuer: 1 as number
    }
  },
  persist: {
    // 持久化存储
    // 在这里进行自定义配置
  }
})
