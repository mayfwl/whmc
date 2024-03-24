import { darkTheme } from 'naive-ui'
import { defineStore } from 'pinia'

import { initThemeSettings } from './helpers'

type ThemeState = Theme.Setting
export const useThemeStore = defineStore('theme-store', {
  state: (): ThemeState => initThemeSettings(),
  getters: {
    naiveTheme: (state) => (state.darkModes ? darkTheme : null)
  }
})
