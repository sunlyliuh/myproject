<?php

/**
 *php实现下载远程图片到本地
 *@param $url       string      远程文件地址
 *@param $filename  string      保存后的文件名（为空时则为随机生成的文件名，否则为原文件名）
 *@param $fileType  array       允许的文件类型
 *@param $dirName   string      文件保存的路径（路径其余部分根据时间系统自动生成）
 *@param $type      int         远程获取文件的方式
 *@return           json        返回文件名、文件的保存路径
 * 
 * 例子：{'fileName':13668030896.jpg, 'saveDir':/www/test/img/2013/04/24/}
 */
echo getImage('http://gi2.md.alicdn.com/bao/uploaded/i2/TB1IHwfHXXXXXbXXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '', 'D:/www/easyphp/trunk/document/images', array('jpg', 'gif'));
function getImage($url, $filename='', $dirName, $fileType, $type=0)
{
    if($url == ''){return false;}
    //获取文件原文件名
    $defaultFileName = basename($url);
    //获取文件类型
    $suffix = substr(strrchr($url,'.'), 1);
    if(!in_array($suffix, $fileType)){
        return false;
    }
    //设置保存后的文件名
    $filename = $filename == '' ? time().rand(0,9).'.'.$suffix : $defaultFileName;
          
    //获取远程文件资源
    if($type){
        $ch = curl_init();
        $timeout = 5;
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $file = curl_exec($ch);
        curl_close($ch);
    }else{
        ob_start();
        readfile($url);
        $file = ob_get_contents();
        ob_end_clean();
    }
    //设置文件保存路径
    $dirName = $dirName.'/'.date('Y', time()).'/'.date('m', time()).'/'.date('d',time()).'/';
    if(!file_exists($dirName)){
        mkdir($dirName, 0777, true);
    }
    //保存文件
    $res = fopen($dirName.$filename,'a');
    fwrite($res,$file);
    fclose($res);
    return "{'fileName':$filename, 'saveDir':$dirName}";
}
?>
