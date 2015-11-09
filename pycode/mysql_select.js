var mysql = require('mysql');

var connection = mysql.createConnection({
	host : '127.0.0.1',
	user : 'root',
	password : '',
	port : '3306',
	database : 'mongodb'
});

connection.connect();

var userGetSql = 'select * from userinfo limit 2';
// 查找，这里面的查询默认是查多条记录
connection.query(userGetSql,function(err,result){
	if(err){
		console.log('[select error]'.err.message);
		return;
	}

	console.log('----------------------------------------select---------------------');
	console.log(result);
	console.log('----------------------------------------end------------------------\n\n');
});

connection.end();