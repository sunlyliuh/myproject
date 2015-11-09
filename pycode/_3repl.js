// 输入以下命令来启动终端 node
>1+4
>5/2
>3*6
>4-1
// 使用变量
>x=10
10
>var y=10
undefined
>x+y
20

>console.log('hello world')
hello world
undefined

>console.log("www.runoob.com")
www.runoob.com
undefined

// 多行表达式
>var x=0
> do {
	x++;
	console.log("x:"+x);
}while(x<5);

x:1
x:2
x:3
x:4
x:5
undefined

// 下划线变量
>var x=10
undefined
>var y=20
undefined
>x+y
30
>var sum=_
undefined
>console.log(sum)
30
undefined

REPL命令
ctrl+c  退出当前终端
ctrl +c 按下2次  退出node repl
ctrl + d 退出Node repl
tab   列出当前命令
.help 列出使用命令