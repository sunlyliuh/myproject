//匿名函数
function execute(someFunction,value){
	someFunction(value);
}
// 直接在这进行调用
execute(function(word){console.log(word)}, "hello");

// http里面也是定义了一个匿名函数
var http = require("http");
http.createServer(function(request, response){
	response.writeHead(200,{"Content-Type":"text/plain"});
	response.write("hello world");
	response.end();
}).listen(8888);

// 上面的还可以这样写
var http = require("http");

function onRequest(request, response){
	response.writeHead(200,{"Content-Type":"text/plain"});
	response.write("hello world");
	response.end();
}

http.createServer(onRequest).listen(8888);