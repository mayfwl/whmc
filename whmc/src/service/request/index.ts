import axios from 'axios'
import { useMessage } from 'naive-ui'

import { useUser } from '@/stores/modules/auth'

const message = useMessage()
// 创建一个带有配置项的axios函数
const myAxios = axios.create({
  baseURL: 'http://127.0.0.1:3007'
})

// 白名单: 不需要携带token的api地址
const whiteAPIList = ['/api/reg', '/api/login', '/api/codelogin', 'api/respwd']

// 定义一个请求拦截器
myAxios.interceptors.request.use(
  function (config) {
    // 在发送请求之前做些什么
    const user = useUser()
    if (config.url && !whiteAPIList.includes(config.url)) {
      // 为请求头挂载 Authorization 字段
      config.headers.Authorization = user.token
    }
    return config
  },
  function (error) {
    // 对请求错误做些什么
    return Promise.reject(error)
  }
)

myAxios.interceptors.response.use(
  function (response) {
    // 2xx 范围内的状态码都会触发该函数。
    // 对响应数据做点什么

    return response
  },
  function (error) {
    // 超出 2xx 范围的状态码都会触发该函数。
    // 对响应错误做点什么
    return Promise.reject(error)
  }
)

export default myAxios
