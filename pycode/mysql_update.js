var mysql = require('mysql');

var connection = mysql.createConnection({
	host : '127.0.0.1',
	user : 'root',
	password : '',
	port : '3306',
	database : 'mongodb'
});

connection.connect();

var userModSql = 'update userinfo set UserName = ?,UserPass = ? where Id = ?';
var userModSql_Params = ['刘辉','123456',1];

//修改数据
connection.query(userModSql,userModSql_Params, function(err,result){
	if(err){
		console.log('[UPDATE ERROR] - ',err.message);
		return;
	}
	console.log('---------------------------------------------update----------------------');
	console.log('update affectedRows',result.affectedRows);
	console.log('---------------------------------------------end--------------------------\n\n');
});

connection.end();