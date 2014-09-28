<?php
/**
 * 根据图片url下载图片到images目录
 * @param type $url
 */
function getPicByUrl($url){
    $data = file_get_contents($url);
    if($data){
        $fileDir = 'images/'.date('Y-m-d').'/';
        if(!file_exists($fileDir)){ // 创建目录
            mkdir($fileDir);
        }
        $pathUrl = pathinfo($url);
        $fileName = $fileDir.$pathUrl['basename'];
        
        if(file_exists($fileName)) {
            echo $fileName.':file has exist';
        }else{
            $fileHandle = fopen($fileName, 'w+');
            fwrite($fileHandle, $data);
            fclose($fileHandle);
            echo $fileName.':write success';
        }
    }
}

$url = 'http://g.hiphotos.baidu.com/image/pic/item/8644ebf81a4c510fbf8333066359252dd42aa563.jpg';

getPicByUrl($url);
