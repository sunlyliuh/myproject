// nodejs 常用工具 util.inherits
// util.inherits 是一个实现对象间原型继承的函数
var util = require('util');
function Base(){
	this.name = 'base';
	this.base = 1991;
	this.sayHello = function(){
		console.log('Hello' + this.name);
	};
}

Base.prototype.showName = function(){
	console.log(this.name);
}

function Sub(){
	this.name = 'sub';
}

util.inherits(Sub, Base);
var objBase = new Base();
objBase.showName();
objBase.sayHello();
console.log(objBase);

var objSub = new Sub();
objSub.showName();
console.log(objSub);

// util.inspect 将任意对象转换为字符串的方法
function Person(){
	this.name = 'byvoid';
	this.toString = function(){
		return this.name;
	}
}

var obj = new Person();
console.log(util.inspect(obj));
console.log(util.inspect(obj,true));

// isArray 判断是否是一个数组
console.log(util.isArray([])); // true
console.log(util.isArray(new Array)); // true
console.log(util.isArray({})); // false

// isRegExp 判断给定的参数是否是一个正则表达式
console.log(util.isRegExp(/some regexp/)); // true
console.log(util.isRegExp(new RegExp('another regexp'))); // true
console.log(util.isRegExp({})); // fasle

// isDate 判断给定的参数是否是一个日期，是日期返回true
console.log(util.isDate(new Date)); // true
console.log(util.isDate(Date())); // false
console.log(util.isDate({})); // false

