<?php

// 文件上传 方法
//require_once('qiniu/rs.php');
//require_once('qiniu/io.php');
//
//$bucket = 'zhaoliwu';
//$key1 = 'file_name_1'; // 重命名的文件名
//$file = 'E:\xampps\htdocs\qiniu\logo.jpg'; // 上传文件的位置
//
//$accessKey = 'wtRqWbSaRJh7MLc2vI3G1rmo3sflwowIzLZEHve2'; // access key
//$secretKey = 'grO6J2ivv5ZWcwgIKZ5q2_4xdYPdtOsuq4nrn49E'; // sercet key
//Qiniu_setKeys($accessKey, $secretKey); //   
//
//$putPolicy = new Qiniu_RS_PutPolicy($bucket);
//$upToken = $putPolicy->Token(null);
//$putExtra = new Qiniu_PutExtra();
//$putExtra->Crc32 = 1;
//list($ret, $err) = Qiniu_PutFile($upToken, $key1, $file, $putExtra);
//echo "\n\n====> Qiniu_PutFile result: \n";
//if ($err !== null) {
//	var_dump($err);
//} else {
//	var_dump($ret);
//}

// 文件删除
//require_once('qiniu/rs.php');
//
//$bucket = 'zhaoliwu';
//$key1 = 'file_name_1';
//
//$accessKey = 'wtRqWbSaRJh7MLc2vI3G1rmo3sflwowIzLZEHve2';
//$secretKey = 'grO6J2ivv5ZWcwgIKZ5q2_4xdYPdtOsuq4nrn49E';
//Qiniu_setKeys($accessKey, $secretKey);
//
//$client = new Qiniu_MacHttpClient(null);
//$err = Qiniu_RS_Delete($client, $bucket, $key1);
//echo "\n\n====> Qiniu_RS_Delete result: \n";
//if ($err !== null) {
//	var_dump($err);
//} else {
//	echo "Success! \n";
//}

// 上传文件 （不是本地文件上传）
$act = isset($_GET['act']) ? $_GET['act'] : '';
if($act == 'upload'){
    $tempFileName = $_FILES['userfile']['tmp_name'];
//    print_r($_FILES);exit;
    require_once('qiniu/rs.php');
    require_once('qiniu/io.php');

    $bucket = 'zhaoliwu';
    $key1 = date('Y-m-d,H:i:s').$_FILES['userfile']['name']; // 重命名的文件名
    $file = $tempFileName; // 上传文件的位置

    $accessKey = 'wtRqWbSaRJh7MLc2vI3G1rmo3sflwowIzLZEHve2'; // access key
    $secretKey = 'grO6J2ivv5ZWcwgIKZ5q2_4xdYPdtOsuq4nrn49E'; // sercet key
    Qiniu_setKeys($accessKey, $secretKey); //   

    $putPolicy = new Qiniu_RS_PutPolicy($bucket);
    $upToken = $putPolicy->Token(null);
    $putExtra = new Qiniu_PutExtra();
    $putExtra->Crc32 = 1;
    list($ret, $err) = Qiniu_PutFile($upToken, $key1, $file, $putExtra);
    echo "\n\n====> Qiniu_PutFile result: \n";
    if ($err !== null) {
        var_dump($err);
    } else {
        picThumb($accessKey, $secretKey, $key1, $width=100, $height=100);
        var_dump($ret);
    }
}else{
    echo 'no act';
    
    $url = 'http://zhaoliwu.qiniudn.com/2014-10-15%2C06%3A18%3A24Jellyfish.jpg?imageView/1/w/1000/h/1000&e=1413357504&token=wtRqWbSaRJh7MLc2vI3G1rmo3sflwowIzLZEHve2:E1nMswxq9uvIb0tK2Mu-3PQ62v4';
    echo 'string length:'.strlen($url);
    
}

function picThumb($accessKey, $secretKey, $key1, $width, $height){
    // --------------------------压缩图片 start
//    require_once('qiniu/rs.php');
    require_once('qiniu/fop.php');
    $key1 = $key1;
    $domain = 'zhaoliwu.qiniudn.com';

    Qiniu_setKeys($accessKey, $secretKey);

    //$baseUrl 就是您要访问资源的地址
    $baseUrl = Qiniu_RS_MakeBaseUrl($domain, $key1);
    $getPolicy = new Qiniu_RS_GetPolicy();
    $imgView = new Qiniu_ImageView;
    $imgView->Mode = 1;
    $imgView->Width = $width;
    $imgView->Height = $height;

    //生成fopUrl
    $imgViewUrl = $imgView->MakeRequest($baseUrl);

    //对fopUrl 进行签名，生成privateUrl。 公有bucket 此步可以省去。
    $imgViewPrivateUrl = $getPolicy->MakeRequest($imgViewUrl, null);
    echo "\n\n====> imageView privateUrl: \n";
    echo $imgViewPrivateUrl . "\n";
    // ------------------------------------ end
}

?>
<html>
    <head>
        <title>qiniu 开放平台--文件存储</title>
    </head>
    <body>
<form enctype="multipart/form-data" action="index.php?act=upload" method="POST">
    <!-- MAX_FILE_SIZE must precede the file input field -->
    <input type="hidden" name="MAX_FILE_SIZE" value="3000000" />
    <!-- Name of input element determines name in $_FILES array -->
    Send this file: <input name="userfile" type="file" />
    <input type="submit" value="Send File" />
</form>
    </body>
</html>
