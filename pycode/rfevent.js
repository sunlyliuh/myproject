var EventEmitter = require('events').EventEmitter;
var ee = new EventEmitter();

var listener = function(foo, bar)
{
	console.log("第1个监听事件，参数foo="+foo+",bar="+bar);
}

var listener2 = function(foo, bar)
{
	console.log("第2个监听事件，参数foo="+foo+",bar="+bar);
}

var listener3 = function(foo, bar)
{
	console.log("第3个监听事件，参数foo="+foo+",bar="+bar);
}

ee.on('some_events', listener);

ee.on('some_events', listener2);

ee.on('some_events', listener3);

/*
    EventEmitter.removeListener(event, listener)  移除指定事件的监听器
    注意：该监听器必须是注册过的
    PS：上一个例子之后以会失败，很大原因就是忽略了监听器，理所当然的认为传个事件名就OK了，所以就悲剧了!
*/
ee.removeListener('some_events', listener);

ee.removeListener('some_events', listener3);

ee.emit('some_events', 'Wilson', 'Zhong');