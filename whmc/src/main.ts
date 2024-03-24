import naive from 'naive-ui'
import { createApp } from 'vue'
import BaiduMap from 'vue-baidu-map-3x'

import App from './App.vue'
import { setupAssets } from './plugins'
import { setupRouter } from './router'
import { setupStore } from './stores'

async function setupApp() {
  // 导入tailwindcss等css资源
  setupAssets()

  const app = createApp(App)
  // store plugin: pinia
  setupStore(app)

  // vue router
  await setupRouter(app)

  app.use(naive)
  app.use(BaiduMap, {
    // ak 是在百度地图开发者平台申请的密钥 详见 http://lbsyun.baidu.com/apiconsole/key */
    ak: 'lsu0AtSzvm5tsfimhLhBPm3e10oRGCm6'
    // v:'2.0',  // 默认使用3.0
    // type: 'WebGL' // ||API 默认API  (使用此模式 BMap=BMapGL)
  })
  // mount app
  app.mount('#app')
}
setupApp()
