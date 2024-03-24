// 数据库连接模块

// 导入数据库
const mysql=require('mysql');

// 配置数据库
const db=mysql.createPool({
    host:'127.0.0.1',
    user:'root',
    password:'123456',
    database:'whmc'
})

// 共享数据库连接对象
module.exports=db;