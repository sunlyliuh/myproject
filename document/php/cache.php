<?php

$interval=5;
session_cache_limiter('private_no_expire'); //在session之后处理缓存, 需要加上这个.
session_start();
 
if ($_SERVER['HTTP_IF_MODIFIED_SINCE']){
    // HTTP_IF_MODIFIED_SINCE即下面的: Last-Modified,文档缓存时间.
    // 缓存时间+时长. 
    $ctime = strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE'])+$interval;
          
    // 当大于当前时间时, 表示还在缓存中... 释放304
    if($ctime > time()){
       header('HTTP/1.1 304 Not Modified');
       exit();
    }
}
 
// 上面这段代码未使用任何其它库, 所以可以放在首行.
  
header("Pragma: private");
header("Cache-Control:max-age=$interval, pre-check=$interval"); 
header("Expires: " . gmdate("D, d M Y H:i:s",time()+$interval)." GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
  
  
echo date('Y-m-d H:i:s'); // 注意看是不是差5秒刷新一次.
echo ' - <a href="?a=">Link</a><br />';
var_dump($_SERVER['HTTP_IF_MODIFIED_SINCE']);
