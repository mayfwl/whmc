declare namespace UnionKey {
  /** http请求头的content-type类型 */
  type ContentType =
    | 'application/json'
    | 'application/x-www-form-urlencoded'
    | 'multipart/form-data'

  /**
   * 登录模块
   * - pwd-login: 账密登录
   * - code-login: 手机验证码登录
   * - register: 注册
   * - reset-pwd: 重置密码

   */
  type LoginModule = 'pwd-login' | 'code-login' | 'register' | 'reset-pwd'

  /**
   * 过渡动画类型
   * - zoom-fade: 渐变
   * - zoom-out: 闪现
   * - fade-slide: 滑动
   * - fade: 消退
   * - fade-bottom: 底部消退
   * - fade-scale: 缩放消退
   */
  type ThemeAnimateMode =
    | 'zoom-fade'
    | 'zoom-out'
    | 'fade-slide'
    | 'fade'
    | 'fade-bottom'
    | 'fade-scale'
}
