<?php
include 'tao-sdk/TopSdk.php';
$c = new TopClient;
$c->format = 'json';
$c->appkey = '23124076';
$c->secretKey = '4e85b27be20292da10c30fcd115e07b1';
$req = new TbkItemsDetailGetRequest;
$req->setTrackIids("");
$req->setFields("num_iid,seller_id,nick,title,price,volume,pic_url,item_url,shop_url");
$req->setNumIids("37301356780");
$resp = $c->execute($req);

var_dump($resp);
