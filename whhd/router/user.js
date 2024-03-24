// 为主函数提供路由
const express = require("express");
// 创建路由对象
const router = express.Router();


// 导入路由模块的处理函数
const userHanler = require("../router_handler/user");


// 创建新用户
router.post("/reg",  userHanler.regUser);

// 忘记密码
router.post("/respwd",  userHanler.respwd);
// 登录
router.post("/login",  userHanler.login);

router.post("/codelogin",  userHanler.codelogin);

router.post("/huoqucode",  userHanler.huoqucode);
module.exports = router;