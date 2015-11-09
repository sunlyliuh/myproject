// 引入 events 模块
// var events = require('events');
// 创建 eventEmitter 对象
// var eventEmitter = new events.EventEmitter();

// 以下程序绑定事件处理程序：

// 绑定事件及事件的处理程序
// eventEmitter.on('eventName', eventHandler);

// 我们可以通过程序触发事件：

// // 触发事件
// eventEmitter.emit('eventName');

// 引入events模块
var events = require('events');
// 创建 eventEmitter对象
var eventEmitter = new events.EventEmitter();

// 创建时间处理程序
var connectHandle = function connected(){
	console.log('连接成功');
	// 触发data_received事件
	eventEmitter.emit('data_received');
}

// 绑定connection事件处理程序
eventEmitter.on('connection', connectHandle);

// 使用匿名函数绑定data_received事件
eventEmitter.on('data_received',function(){
	console.log('数据接收成功');
});

// 触发connection事件
eventEmitter.emit('connection');
console.log('程序执行完毕');