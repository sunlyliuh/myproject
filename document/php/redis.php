<?php

$redis= new Redis();
$redis->connect('192.168.0.34',6379);
//$redis->set('goods_count',10);
echo $redis->get('goods_count');


//$redis->delete('userlist');
//
$userList = array();
$userArr = $redis->lrange('userlist',0,-1);
foreach($userArr as $key=>$user){
    $userList[$key] = json_decode($user,true);
}
var_dump($userList);

