var hello = require('./hello');
hello.world();

// 直接调用一个对象
hello = new hello();
Hello.setName('liuhui');
hello.sayHello();