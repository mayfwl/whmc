/** @type {import('tailwindcss').Config} */
module.exports = {
  // 禁用预加载，修复tailwind样式 与 naive-ui button等样式等冲突问题
  corePlugins: {
    preflight: false
  },
  purge: ['./index.html', './src/**/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      animation: {
        // home页面字体缓慢切换
        texttop: 'texttop 8s ease infinite',
        sildeleft: 'sildeleft 0.5s ease-in-out'
      },
      keyframes: {
        // home页面字体缓慢切换
        texttop: {
          '0%': { transform: 'translateY(0)' },
          '33.33%': {
            transform: 'translateY(-33.6px)'
          },
          '66.66%': { transform: 'translateY(-67.2px)' },
          '99.99%': { transform: 'translateY(-100.8px)' }
        },
        sildeleft: {
          from: {
            transform: 'translateX(0)'
          },
          to: {
            transform: 'translateX(-15px)'
          }
        }
      }
    }
  },
  variants: {
    extend: {}
  },
  plugins: []
}
