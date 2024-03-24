// 为主函数提供路由
const express = require("express");
// 创建路由对象
const router = express.Router();

// 导入营地信息实现模块
const trail = require("../router_handler/trail");
// 获取营地信息
router.get("/all", trail.getTailInfo);
// 获取对应id营地
router.get("/info", trail.getTailInfoById);

// 获取对应营地的活动
router.get("/act", trail.getTailActivity);

// 订单生成
router.post("/order", trail.addOrder);
module.exports = router;