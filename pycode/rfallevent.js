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


ee.on('some_events', listener);

ee.on('some_events', listener2);

ee.on('other_events', function(foo,bar){
	console.log("其他监听事件，参数foo="+foo + ",bar="+bar);
});


/*
    EventEmitter.removeAllListeners([event])   移除（批定事件）所有监听器
    参数1：可选参数，event  字符串，事件名
*/
ee.removeAllListeners();

ee.emit('some_events', 'Wilson', 'Zhong');
ee.emit('other_events', 'Wilson', 'Zhong');