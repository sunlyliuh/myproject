var events = require('events');
var eventEmitter = new events.EventEmitter();

// 监听器1
var listen1 = function listen1(){
	console.log('监听器 listen1 执行');
}

// 监听器2
var listen2 = function listen2(){
	console.log('监听器 listen2 执行');
}

eventEmitter.addListener('connection', listen1);

eventEmitter.addListener('connection', listen2);

var eventListeners = require('events').EventEmitter.listenerCount(eventEmitter,'connection');
console.log(eventListeners+"监听器监听连接事件");

// 处理connection事件
eventEmitter.emit('connection');

// 移除绑定的 listen1函数
eventEmitter.removeListener('connection', listen1);
console.log('listen1 不再监听');

// 触发连接事件
eventEmitter.emit('connection');

eventListeners = require('events').EventEmitter.listenerCount(eventEmitter,'connection');
console.log(eventListeners + "监听器监听连接事件。");

console.log("程序执行完毕");