var fs = require("fs");

// 异步读取文件
fs.readFile('input.txt',function(err,data){
	if(err){
		return console.error(err);
	}

	console.log("异步读取:" + data.toString());
});

// 同步读取文件
var data = fs.readFileSync('input.txt');
console.log("同步读取:" + data.toString());

console.log("程序执行完毕");

// 异步打开文件
fs.open('input.txt','r+', function(err,fd){
	if(err){
		return console.log(err);
	}
	console.log("文件打开成功");
});

// 获取文件信息 fs.stat
fs.stat('d:/nodejs/code/index.js',function(err,stats){
	console.log(stats.isFile());
	console.log(stats);
});

// 异步模式写入文件
fs.writeFile('test.txt','这个是异步写入的文件内容',function(err){
	if(err){
		return console.error(err);
	}
	console.log("数据写入成功!");
	console.log("------------我是分割线--------------");
	console.log("读取数据写入的数据");
	fs.readFile('test.txt',function(err,data){
		if(err){
			return console.error(err);
		}
		console.log("异步读取文件数据:"+data.toString());
	});
});
