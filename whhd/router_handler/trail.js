// 营地的操作
// 导入数据库模块
const db = require("../db/index");
// 为生成一个id
const { v4: uuidv4 } = require('uuid');
function generateUserId() {
    // Generate a random UUID.
    const id = uuidv4();
  
    // Return the generated ID.
    return id;
  }
// 获取营地信息
exports.getTailInfo = (req, res) => {
    const sql = "select * from trail";
    db.query(sql, (err, results) => {
        if (err) return res.cc(err);
      
        res.send({
            status: 0,
            message: "获取成功",
            data: results
        });
    });
}

// 获取指定id的营地
exports.getTailInfoById = (req, res) => {
    const sql = "select * from trail where id=?";
    db.query(sql, req.query.id, (err, results) => {
        if (err) return res.cc(err);
        const trailstr={...results[0]}
        const sqlstr="select * from trailimg where trail_id=?"
         db.query(sqlstr,req.query.id,(err,results)=>{
          if (err) return res.cc(err);
          const trail={...trailstr,results}
          res.send({
              status: 0,
              message: "获取成功",
              data: trail
          });
        })
      
    });
}

// 获取对应活动
exports.getTailActivity = (req, res) => {
    const sql = "select * from activity where yid=?";
    db.query(sql, req.query.yid, (err, results) => {
        if (err) return res.cc(err);
        res.send({
            status: 0,
            message: "获取成功",
            data: results[0]
        });
    });
}

// 生成订单
exports.addOrder = (req, res) => {
    const userId = generateUserId();
    const order={...req.body,id:userId}
    const sql = "insert into order_goods set ?";
    db.query(sql, order, (err, results) => {
        if (err) return res.cc(err);
        res.send({
            status: 0,
            message: "预约成功",
            data: results
        });
    });
}

// 用户未完成的订单
exports.userorder=(req,res)=>{
  const sql='select * from order_goods where user_id=? and end=0'
  db.query(sql,req.query.id,(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}

// 用户完成的订单
exports.userendorder=(req,res)=>{
    const sql='select * from order_goods where user_id=? and end=1'
    db.query(sql,req.query.id,(err,results)=>{
      if (err) return res.cc(err);
      res.send({
        status: 0,
        message: "获取成功",
        data: results
      });
    })
  }

//   用户打分
exports.userscore=(req,res)=>{
  const sql='update order_goods set score=? where id=?'
  db.query(sql,[req.body.score,req.body.id],(err,results)=>{
    if (err) return res.cc(err);
    res.send({
      status: 0,
      message: "获取成功",
      data: results
    });
  })
}