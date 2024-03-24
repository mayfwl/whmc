export function scortitle(x: number): string | void {
  if (x >= 9) {
    return '超赞'
  } else if (x >= 8) {
    return '非常棒'
  } else if (x >= 7) {
    return '很好'
  } else {
    return '不错'
  }
}
