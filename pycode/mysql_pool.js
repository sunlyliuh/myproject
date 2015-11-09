var mysql = require('mysql');

var pool = mysql.createPool({
	host : '127.0.0.1',
	user : 'root',
	password : '',
	port : '3306',
	database : 'mongodb'
});

pool.getConnection(function(err, connection){
	connection.query('select * from userinfo where Id=1;', function(err, result){
		console.log(result);
        connection.release();
	});

	connection.query('select * from userinfo where Id=3;', function(err, result){
		console.log(result);
        connection.release();
	});

});