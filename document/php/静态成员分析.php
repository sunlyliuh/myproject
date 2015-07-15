<?php
/**
 * 这篇博客主要是用来分析类里面的静态成员的
 * test是一个类，里面的成员及方法都是静态的。
 * 然后我通过新建2个文件test1.php和test2.php
 * 在浏览器里面分别访问test1.php和test2.php
 * 发现test1.php里面输出的值是3，
 * test2.php里面输出的值是2，
 * 说明静态成员在一个连接访问时里面的值是会一直不变的，当换了一个链接之后又从0开始进行。
 */

class Test{
    public static $a = 0;
    
    public static function setA(){
        self::$a++;
    }
    
    public static function getA(){
        echo self::$a;
    }
}
?>

test1.php

<?php

include 'test.class.php';
Test::setA();
Test::setA();
Test::setA();
Test::getA();
?>

test2.php
<?php
include 'test.class.php';

Test::setA();
Test::setA();
Test::getA();
?>


