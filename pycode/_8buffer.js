// 创建buffer
// var buf = new Buffer(10);

// var buf = new Buffer([10,20,30,40,50]);

// var buf = new Buffer("www.runoob.com","utf-8");

// 写入缓冲区
// buf = new Buffer(256);
// len = buf.write("www.runoob.com");
// console.log("写入字节数:"+len);

// 从缓冲区中读取数据
// console.log(buf.toString('utf8',0,14));

buf = new Buffer(26);
for (var i=0; i<26; i++){
	buf[i] = i+97;
}

console.log(buf.toString('ascii'));
// 将buffer转换成json对象
var buf = new Buffer('www.runoob.com');
var json = buf.toJSON(buf);

console.log(json);