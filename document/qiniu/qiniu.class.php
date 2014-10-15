<?php

require_once('qiniu/rs.php');

/**
 * 七牛云存储整理类
 * 调用例子
    $qiniuClass = new Qiniu("zhaoliwu");
    $qiniuFileName = date('Ymd:H:i:s').$_FILES['userfile']['name'];
    $res = $qiniuClass->uploadFile('userfile', $qiniuFileName);
    if($res['succ']){ // 上传成功
        echo 'success';
    }else{
        echo 'error';
    }
 */
class Qiniu{
    private $_bucket; // 七牛文件夹名称
    
    public function __construct($bucket) {
        $this->_bucket = $bucket;
    }
    
    /**
     * 上传文件
     * @param type $uploadFile 文本框上传文件名
     * @param type $qiniuFileName 存储在七牛里面的文件名
     */
    public function uploadFile($uploadFile, $qiniuFileName)
    {
        
        require_once('qiniu/io.php');

        $file = $_FILES[$uploadFile]['tmp_name']; // 上传文件的位置

        $putPolicy = new Qiniu_RS_PutPolicy($this->_bucket);
        $upToken = $putPolicy->Token(null);
        $putExtra = new Qiniu_PutExtra();
        $putExtra->Crc32 = 1;
        list($ret, $err) = Qiniu_PutFile($upToken, $qiniuFileName, $file, $putExtra);
        
        if ($err !== null) {
            return array('succ'=>false,'data'=>$err);
        } else {
//            picThumb($accessKey, $secretKey, $key1, $width=100, $height=100);
            return array('succ'=>true, 'data'=>$ret);
        }
    }
    
    /**
     * 获取缩略图地址
     * @param type $qiniuFileName 已经存在的文件名
     * @param type $width 宽度
     * @param type $height 高度
     */
    public function getThumb($qiniuFileName, $width, $height )
    {
        require_once('qiniu/fop.php');
        $key1 = $qiniuFileName;
        $domain = 'zhaoliwu.qiniudn.com';

        //$baseUrl 就是您要访问资源的地址
        $baseUrl = Qiniu_RS_MakeBaseUrl($domain, $key1);
//        $getPolicy = new Qiniu_RS_GetPolicy();
        $imgView = new Qiniu_ImageView;
        $imgView->Mode = 1;
        $imgView->Width = $width;
        $imgView->Height = $height;

        //生成fopUrl
        $imgViewUrl = $imgView->MakeRequest($baseUrl);
        return $imgViewUrl;
        
        //对fopUrl 进行签名，生成privateUrl。 公有bucket 此步可以省去。
//        $imgViewPrivateUrl = $getPolicy->MakeRequest($imgViewUrl, null);
//        echo "\n\n====> imageView privateUrl: \n";
//        echo $imgViewPrivateUrl . "\n";
    }
    
    /**
     * 删除存储的文件
     * @param type $qiniuFileName 云存储里的文件名
     */
    public function deleteFile($qiniuFileName)
    {

        $key1 = $qiniuFileName;

        $client = new Qiniu_MacHttpClient(null);
        $err = Qiniu_RS_Delete($client, $this->_bucket, $key1);

        if ($err !== null) {
            var_dump($err);
        } else {
            echo "Success! \n";
        }
    }
}
?>
