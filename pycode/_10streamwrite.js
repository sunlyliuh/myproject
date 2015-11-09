var fs = require("fs");
var data = '测试写入流数据了';

var writeStream = fs.createWriteStream('output.txt');

writeStream.write(data, 'UTF-8');

writeStream.end();

writeStream.on('finish', function(){
	console.log('写入完成');
});

writeStream.on('error',function(err){
	console.log('err.stack');
});

console.log('程序执行完毕');