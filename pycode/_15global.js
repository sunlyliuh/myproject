// 输出全局变量__filename的值  表示当前正在执行的脚本的文件名
console.log(__filename);

// __dirname 表示当前执行脚本所在的目录
console.log(__dirname);

function printHello(){
	console.log("Hello world");
}
// 2秒后执行
setTimeout(printHello, 2000);

var t = setTimeout(printHello, 2000);

clearTimeout(t);

// setInterval()方法会不停的调用函数
// setInterval(printHello, 2000);

process.stdout.write("Hello world2");

// 输出当前目录
console.log('当前目录' + process.cwd());

// 输出当前版本
console.log('当前版本' + process.version);
// 输出内存使用情况
console.log(process.memoryUsage());
