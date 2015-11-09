// 阻塞代码实例
// var fs = require("fs");

// var data = fs.readFileSync('input.txt');

// console.log(data.toString());
// console.log("程序执行结束");

// 非阻塞代码实例

var fs = require("fs");

fs.readFile('input.txt',function(err,data){
	if(err){
		return console.error(err);
	}
	console.log(data.toString());
});

console.log("程序执行结束");

// 非阻塞方法会先执行完后面的代码，然后再执行回调函数里面的方法，因此会比较快。