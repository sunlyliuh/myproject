var mysql = require('mysql');
var connection = mysql.createConnection({
	host : '127.0.0.1',
	user : 'root',
	password : '',
	port : '3306',
	database : 'mongodb'
});

connection.connect();

var userDelSql = 'delete from userinfo where id = ?';
var userDelSql_params = ['2'];

connection.query(userDelSql,userDelSql_params, function(err,result){
	if(err){
		console.log('[delete error] - ',err.message);
		return;
	}

	console.log('--------------------------------delete-------------------------');
	console.log('delete affectedRows',result.affectedRows);
	console.log('--------------------------------end ---------------------------');
});

connection.end();