<?php
session_start();
ini_set('date.timezone','Asia/Shanghai');
// reids 链接
$redis= new Redis();
$redis->connect('192.168.0.34',6379);

$arr = array(
    'succ' =>'F',
    'msg' => '',
);
$act = isset($_GET['act']) ? $_GET['act'] : '';
if($act == 'qiang'){

    // 逻辑处理，抢购程序，没有做特殊处理的代码，取前10位用户,暂时用session来当作用户id
    $goodsCount = $redis->get('goods_count');
    $ip = session_id();
    if($goodsCount > 0){ // 还存在商品，将用户放入一个数组中
        // 判断用户是否已经抢过了
        $exist = 0;
        $userArr = getUserList();
        foreach($userArr as $key=>$user){
            if($userArr[$key]['ip'] == $ip){
                $exist = 1;
                break;
            }
        }
        if($exist){
            $arr['msg'] = $ip.'您已经抢到了商品，不能重复抢哦！';
        }else{
            $userInfo = array(
                'ip' => $ip,
                'addtime' => microtime()
            );
            $redis->rPush('userlist', json_encode($userInfo));
            $redis->decr('goods_count');
            $arr['succ']= 'T';
            $arr['msg'] = $userInfo['ip'].'恭喜您，抢到了商品!';
        }

    }else{ // 不存在商品了，直接返回数据
        $arr['msg'] = '商品已经抢光了,谢谢您的参与，下次再来吧';
    }
    backjson($arr);
} elseif ($act == 'user'){ //获取中奖用户
    $msg = "";
    $userArr = getUserList();
    if(!empty($userArr)){
        foreach($userArr as $user){
            $msg .= "<tr>
            <td>". $user['ip']."</td>
            <td>".$user['addtime']."</td>
        </tr>";
        }
    }else{
        $msg .="<tr colspan='2'>没有查询到用户</tr>";
    }
    $arr['succ'] ='T';
    $arr['msg'] = $msg;
    backjson($arr);
} elseif ($act == 'gettime'){
    $time = date("Y-m-d H:i:s");
}

function backjson($data){
    echo json_encode($data);
    exit;
}

function getUserList(){
    global $redis;
    $userList = array();
    $userArr = $redis->lrange('userlist',0,-1);
    foreach($userArr as $key=>$user){
        $userList[$key] = json_decode($user,true);
    }
    return $userList;
}

?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>秒程序测试</title>
        <script type="text/javascript" src="js/jquery-1.9.1.min.js" ></script>
        <script>

var serverTime = '2015-08-19 15:00:00';
console.log(serverTime);
        $(document).ready(function(){
            $("#miao_btn").click(function(){
                $.ajax({
                    type: "POST",
                    url: "miaosha.php?act=qiang",
                    data: "name=John&location=Boston",
                    dataType:"json",
                    success: function(msg){
                        var mydata = msg;
                        if(mydata.succ=='T'){
                            alert(mydata.msg);
                        }else{
                            alert(mydata.msg);
                        }
                    }
                 });
            });
            
            function getCurrentTime(){
                var date = new Date();
                var year = date.getFullYear();
                var month = date.getMonth()+1;
                month = (month>9) ? month : '0'+month;
                var day = date.getDate();
                var hour = date.getHours();
                var minute = date.getMinutes();
                var second = date.getSeconds();
                second = (second > 9) ? second : '0'+second;
                
                return year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second;
            }
            var currentTime = getCurrentTime();
            console.log(currentTime);
            if(currentTime > serverTime){
                console.log('可以开始抢了');
                $("#miao_btn").removeAttr("disabled");
            }else{
                console.log('还不到时间');
            }
            
            function getDiffTime(){
                diffTime = dateDiff('S', currentTime, serverTime);
                $("#miao_time").html(diffTime);
                setTimeout(getDiffTime, 1000);
                
            }
            function dateDiff(interval, date1, date2)
            {
               varobjInterval = {'D':1000 * 60 * 60 * 24,'H':1000 * 60 * 60,'M':1000* 60,'S':1000,'T':1};
               interval =interval.toUpperCase();
               var dt1 = new  Date(Date.parse(date1.replace(/-/g, '/')));
               var dt2 = new  Date(Date.parse(date2.replace(/-/g, '/')));
               try
               {
                  //alert(dt2.getTime()- dt1.getTime());
                  //alert(eval_r('objInterval.'+interval));
                  //alert((dt2.getTime()- dt1.getTime()) / eval_r('objInterval.'+interval));
                  return Math.round((dt2.getTime() - dt1.getTime()) /eval_r('objInterval.'+interval));
                }
                catch(e)
                {
                  return e.message;
                }
            }
            
            function getUser(){
//             console.log('aaa');
                $.ajax({
                    type: "POST",
                    url: "miaosha.php?act=user",
                    data: "",
                    dataType:"json",
                    success: function(msg){
                        var mydata = msg;console.log(mydata);
                        if(mydata.succ=='T'){
                            $("#user_list").html(mydata.msg);
                        }else{
                            alert(mydata.msg);
                        }
                    }
                 });
                 setTimeout(getUser, 5000);
            }
            getUser();
            getDiffTime();
        })
        </script>
    </head>
    <body>
        <input type="button" id="miao_btn" name="btn_miao" value="抢购商品" disabled="disabled" />
        距离抢购时间还有<span id="miao_time"></span>
        <br />
        <span>抢到的用户如下:</span>
        <table width="400">
            <tr>
                <th>用户ip</th>
                <th>时间</th>
            </tr>
            <tbody id="user_list">
                
            </tbody>

        </table>
    </body>
</html>

