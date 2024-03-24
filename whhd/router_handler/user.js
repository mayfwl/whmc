// 登陆注册处理函数
// 导入数据库模块
const db = require("../db/index");
var QcloudSms = require("qcloudsms_js");
// 导入bcryptjs对密码进行保护
const bcrypt = require("bcryptjs");

// 导入生成token字符de 模块
const jwt = require("jsonwebtoken");

// 导入token字符加密字符串
const config = require("../config");
// 为新用户生成一个id
const { v4: uuidv4 } = require('uuid');
function generateUserId() {
    // Generate a random UUID.
    const id = uuidv4();
  
    // Return the generated ID.
    return id;
  }
//   注册账号
exports.regUser = (req, res) => {
   
    // 接收表单数据no
    const userinfo = req.body;
//  验证输入的验证码是否正确
if(userinfo.code !== '123456'){
    return res.send({
        status: 1,
        message: "验证码输入错误"
    })
}

    // 对用户密码进行bcrypt加密,返回值是加密后的密码字符串bcrypt.hashSync(明文密码，随机盐的长度)
    userinfo.pwd = bcrypt.hashSync(userinfo.pwd, 10);
    // 判断用户名和密码是否合法
    if (!userinfo.name || !userinfo.pwd ) {
      return res.send({
        status: 1,
        message: "用户名或密码不能为空",
      });
    }
  // 检测数据是否存在

  const sqlstr = "select * from user where name=? or phone=?";
  db.query(sqlstr, [userinfo.name,userinfo.phone], (err, results) => {
    if (err) { 
      return res.cc(err);
    } else if (results.length > 0) {
    
      if(results[0].name === userinfo.name){
        return res.cc("用户名被占用");
      }else{
        return res.cc("手机号被占用");
      }
     
    } else {
      // 插入新用户
      // Example usage.
      const userId = generateUserId();
      const sql = "insert into user set ?";
      db.query(
        sql,
        { name: userinfo.name, pwd: userinfo.pwd ,id:userId,phone:userinfo.phone},
        (err, results) => {
          if (err) {
            return res.cc(err);
          }
          if (results.affectedRows !== 1) {
            return res.cc("注册失败");
          } else if ((results.affectedRows = 1)) {
            return res.send({
              status: 0,
              message: "注册成功",
            });
          }
        }
      );
    }
  });
}

// 忘记密码
exports.respwd = (req, res) => {
   // 接收表单数据no
   const userinfo = req.body;

   const sql='select * from user where phone=?';
   db.query(sql,[userinfo.phone],(err,results)=>{
       if(err){
           return res.cc(err);
       }
       else if(results.length == 0){
           return res.cc("该手机号未注册");
       }else{
        const sqlstr ="update user set pwd=? where phone=?";
        const newpwd = bcrypt.hashSync(req.body.pwd, 10);
        db.query(sqlstr,[newpwd,userinfo.phone],(err,results)=>{
            if(err){
                return res.cc(err);
            }
            if(results.affectedRows !== 1){
                return res.cc("修改失败");
            }else if(results.affectedRows == 1){
                return res.send({
                    status: 0,
                    message: "修改成功",
                  });
            }
        })
       }
      })}

// 账号密码登录
exports.login=(req,res)=>{
      // 接收表单数据no
      const userinfo = req.body;
      const sql='select * from user where name=?'
      db.query(sql,[userinfo.name],(err,results)=>{
          if(err){
              return res.cc(err);
          }
          if(results.length == 0){
              return res.cc("该用户未注册");
          }else{
              // 判断密码是否正确
              const compareResult = bcrypt.compareSync(
                  userinfo.pwd,
                  results[0].pwd
              );
              if (!compareResult) {
                  return res.cc("密码错误");
              }
                // 如果登录成功:
    // 生成token字符串，注意在token字符串李不应该出现密码和图像这类信息，所以要先把这些信息去掉
    const user = {
      ...results[0],
      pwd: "",
    };
     // 生成token字段
  
     const jwtstr = jwt.sign(user, config.jwtsecrekey, { expiresIn: "10h" });
     // 将生成的字段返回给客户端
     res.send({
       status: 0,
       message: "登录成功！",
       // 为了方便客户端使用 Token，在服务器端直接拼接上 Bearer 的前缀
       token: "Bearer " + jwtstr,
       
     });
}})}

// 手机号登录
exports.codelogin=(req,res)=>{
    // 接收表单数据no
    const userinfo = req.body;
    const sql='select * from user where phone=?'
    db.query(sql,[userinfo.phone],(err,results)=>{
        if(err){
            return res.cc(err);
        }
        if(results.length == 0){
            return res.cc("该用户未注册");
        }else{
            // 判断密码是否正确
            const compareResult = bcrypt.compareSync(
                userinfo.pwd,
                results[0].pwd
            );
            if (!compareResult) {
                return res.cc("密码错误");
            }
              // 如果登录成功:
      // 生成token字符串，注意在token字符串李不应该出现密码和图像这类信息，所以要先把这些信息去掉
      const user = {
        ...results[0],
        pwd: "",
      };
       // 生成token字段
    
       const jwtstr = jwt.sign(user, config.jwtsecrekey, { expiresIn: "10h" });
       // 将生成的字段返回给客户端
       res.send({
         status: 0,
         message: "登录成功！",
         // 为了方便客户端使用 Token，在服务器端直接拼接上 Bearer 的前缀
         token: "Bearer " + jwtstr,
         
       });
}})}

exports.huoqucode=(req,res)=>{
  // 前端传给后台的手机号
	let tel = req.body.phone;
	
	// 短信应用SDK AppID
	var appid = 1400187558;  // SDK AppID是1400开头
	
	// 短信应用SDK AppKey
	var appkey = "dc9dc3391896235ddc2325685047edc7";
	
	// 需要发送短信的手机号码
	var phoneNumbers = [tel];
	
	// 短信模板ID，需要在短信应用中申请
	var templateId = 285590;  // NOTE: 这里的模板ID`7839`只是一个示例，真实的模板ID需要在短信控制台中申请
	
	// 签名
	var smsSign = "三人行慕课";  // NOTE: 这里的签名只是示例，请使用真实的已申请的签名, 签名参数使用的是`签名内容`，而不是`签名ID`
	
	// 实例化QcloudSms
	var qcloudsms = QcloudSms(appid, appkey);
	
	// 设置请求回调处理, 这里只是演示，用户需要自定义相应处理回调
	function callback(err, ress, resData) {
	    if (err) {
	        console.log("err: ", err);
	    } else {
			res.send({
				code:200,
				data:{
					success:true,
					data:ress.req.body.params[0]
				}
			})
	    }
	}
	
	var ssender = qcloudsms.SmsSingleSender();
	//这个变量：params 就是往手机上，发送的短信
	var params = [  Math.floor( Math.random()*(9999-1000))+1000   ];
	ssender.sendWithParam(86, phoneNumbers[0], templateId,
	  params, smsSign, "", "", callback);  // 签名参数不能为空串


}