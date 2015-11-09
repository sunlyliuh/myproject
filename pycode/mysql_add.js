var mysql = require('mysql');

var connection = mysql.createConnection({
	host : '127.0.0.1',
	user : 'root',
	password : '',
	port : '3306',
	database : 'mongodb'
});

connection.connect();

var userAddSql = 'insert into userinfo(Id,UserName,UserPass) values (0,?,?)';
var userAddSql_Params = ['wilson','abcd'];

// 增加数据
connection.query(userAddSql,userAddSql_Params, function(err,result){
	if(err){
		console.log('[insert error] - ',err.message);
		return;
	}
	console.log('----------------------------insert--------------------------');
	console.log('insert id:',result.insertId);
	console.log('----------------------------end-----------------------------\n\n');
});

connection.end();