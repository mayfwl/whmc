export function formatDate(timestamp: number) {
  const date = new Date(timestamp)
  const year = date.getFullYear().toString().slice(-2) // 获取年份的后两位
  const month = (date.getMonth() + 1).toString().padStart(2, '0') // 获取月份，并确保为两位数
  const day = date.getDate().toString().padStart(2, '0') // 获取日期，并确保为两位数
  const weekdays = ['日', '一', '二', '三', '四', '五', '六']
  const weekday = weekdays[date.getDay()] // 获取星期几
  return `${month}月${day}日（${weekday}）`
}
// 日期

// / 将时间戳转换为 yy月xx日星期m 格式的字符串

// 将毫秒钻化为i天
export function millisecondsToDays(milliseconds: number) {
  const millisecondsPerSecond = 1000
  const secondsPerMinute = 60
  const minutesPerHour = 60
  const hoursPerDay = 24
  const millisecondsPerDay = millisecondsPerSecond * secondsPerMinute * minutesPerHour * hoursPerDay

  return milliseconds / millisecondsPerDay
}

export function getCurrentDateFormatted() {
  const now = new Date()
  const year = now.getFullYear()
  const month = (now.getMonth() + 1).toString().padStart(2, '0') // 月份从0开始，所以加1
  const day = now.getDate().toString().padStart(2, '0')
  return `${year}-${month}-${day}`
}
