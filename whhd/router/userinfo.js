// 为主函数提供路由
const express = require("express");
// 创建路由对象
const router = express.Router();

// 导入用户信息实现模块
const userinfo = require("../router_handler/userinfo");
// 获取用户信息
router.get("/userinfo", userinfo.getUserInfo);
// 用户点赞数量
router.get("/like", userinfo.getLikenum);
// 用户作品数量
router.get("/posts", userinfo.getpostsnum);
// 用户订单数量
router.get("/order", userinfo.getordernum);
// 用户修改信息个人
router.post("/edit", userinfo.edit);
// 用户喜欢类容
router.get('/likes',userinfo.getlikeinfo)

// 获取用户的作品
router.get('/works',userinfo.getworkinfo)

// 获取用户订单
router.get('/orderinfo',userinfo.getorderinfo)
module.exports = router;