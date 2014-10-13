<?php
/**
 * 在定义404页面的时候，为了使状态码返回404，除了使用header设置为404意外，需要特别注意的一个地方是下面应该是使用include来包含404页面，
 * 而不应该是使用header来进行跳转。使用header跳转状态吗返回的就不是404了，这样对于搜索引擎来说还是会继续找这个页面。
 */
$id =$_GET['id'];
if($id > 10){
    echo 'hello';
}else{

@header("http/1.1 404 not found");
@header("status: 404 not found");
include("404.php");
exit(); 

}
?>
