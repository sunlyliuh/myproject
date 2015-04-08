<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<?php
set_time_limit(0);
echo 'starttime:'.date("Y-m-d H:i:s");

$conn = mysql_connect("localhost", "root", "123456") or die('connect error');
mysql_select_db("test", $conn);
 mysql_query("set names 'utf8'");

$csvArr = array('2206-1.csv','2206-2.csv','2206-3.csv','2206-4.csv','2206-5.csv','2206-6.csv','2206-7.csv','2206-8.csv','2206-9.csv',
        '2206-10.csv','2206-11.csv','2206-12.csv','2206-13.csv','2206-14.csv','2206-15.csv','2206-16.csv','2206-17.csv','2206-18.csv','2206-19.csv',
    '2206-20.csv','2206-21.csv','2206-22.csv','2206-23.csv','2206-24.csv','2206-25.csv','2206-26.csv','2206-27.csv','2206-28.csv');

foreach($csvArr as $csvFile)
{
    readBasicCsv('./data/'.$csvFile);
}

echo 'endtime:'.date("Y-m-d H:i:s");
function readBasicCsv($fileName){
    $handle = fopen($fileName,"r");
    $row = 0;

    while ($data = fgetcsv($handle, 20000, ",")) {
        $num = count($data);
        echo "<p> $num fields in line $row: <br>\n";

        $row++;
        $str = '';
        for ($c=0; $c < $num; $c++) {
            $value = iconv("gb2312", "utf-8", trim($data[$c]));
            $value = mysql_real_escape_string($value);
            $str .= "'$value',";
//            echo $data[$c] . "<br>\n";
        }
        $str = rtrim($str,',');
        
        if($row ==1){
            continue;
        }
//        print_r($data);
        // 判断是否重复，不重复就插入数据
        $sql ="SELECT * FROM td_scrm_user WHERE supplierid = '{$data[0]}'";
        $query = mysql_query($sql);
        $userInfo = mysql_fetch_row($query);
        if(!$userInfo){ // 不存在才进行插入
            $insertSql = "
INSERT INTO td_scrm_user (supplierid,nickname,fullname,registertime,source,state,authmobile,authmail,acclink_qty,identity_type,level,serviceid,sellerpunish,sellerstatus,
firstuploadproductdate,first_order_date,cate1_pub_id,cate2_pub_name,dispute_rate,dispute_rate_duty,refund_rate,refund_rate_cause,good_feedback,feedback_rate,
comm_users,idcardconfirmdate,inquiry_qty,first_inquiry,first_started_order_date,descnotmatch_90d,descnotmatch_180d,notrecieved_90d,notrecieved_180d,orders) 
values({$str})";
//        echo $insertSql;
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'插入成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'插入失败<br />';
                file_put_contents('scrmdata.log', 'error sql--'.$insertSql.PHP_EOL,FILE_APPEND);
            }
        }
//        if($row>=10){
//            break;
//        }
    }
    fclose($handle);
}

function readLoginCsv($csvFile)
{
    $handle = fopen($csvFile,"r");
    $row = 0;

    while ($data = fgetcsv($handle, 20000, ",")) {
        $num = count($data);
        echo "<p> $num fields in line $row: <br>\n";

        $row++;
        $str = '';
        for ($c=0; $c < $num; $c++) {
            $data[$c] = iconv("gb2312", "utf-8", trim($data[$c]));
            $data[$c] = mysql_real_escape_string($data[$c]);
            $str .= "'$data[$c]',";
//            echo $data[$c] . "<br>\n";
        }
        $str = rtrim($str,',');
        
        if($row ==1){
            continue;
        }
//        print_r($data);
        // 判断是否重复，不重复就插入数据
        $sql ="SELECT * FROM td_scrm_user WHERE supplierid = '{$data[0]}'";
        $query = mysql_query($sql);
        $userInfo = mysql_fetch_array($query);
        if(!$userInfo){ // 不存在才进行插入
            $insertSql = "
INSERT INTO td_scrm_user (supplierid,logincount_1d,logincount_1w,uploadprods,auditprods,livelisting,searchprodcount_1d,searchprodcount_1w,
searchprodcount_7d,dayonlinetime_1d,dayonlinetime_1w,logincount_7d,dayonlinetime_7d,logincount_1m,dayonlinetime_1m,logincount_30d,
dayonlinetime_30d,logincount_3m,dayonlinetime_3m,logincount_90d,dayonlinetime_90d,searchprodcount_1m,searchprodcount_30d,
searchprodcount_3m,searchprodcount_90d,citystate,user_type,hpq,jgq,company_name,positive_last_2_month,
neutral_last_2_month,negative_last_2_month,nofeedback_rate) 
values({$str})";
        echo $insertSql;
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'插入成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'插入失败<br />';
            }
        }else{//进行数据修改
            $updateSql ="UPDATE td_scrm_user set logincount_1d='{$data[1]}',logincount_1w='{$data[2]}',uploadprods='{$data[3]}',
                auditprods='{$data[4]}',livelisting='{$data[5]}',searchprodcount_1d='{$data[6]}',searchprodcount_1w='{$data[7]}',
searchprodcount_7d='{$data[8]}',dayonlinetime_1d='{$data[9]}',dayonlinetime_1w='{$data[10]}',logincount_7d='{$data[11]}',
    dayonlinetime_7d='{$data[12]}',logincount_1m='{$data[13]}',dayonlinetime_1m='{$data[14]}',logincount_30d='{$data[15]}',
dayonlinetime_30d='{$data[16]}',logincount_3m='{$data[17]}',dayonlinetime_3m='{$data[18]}',logincount_90d='{$data[19]}',
    dayonlinetime_90d='{$data[20]}',searchprodcount_1m='{$data[21]}',searchprodcount_30d='{$data[22]}',
searchprodcount_3m='{$data[23]}',searchprodcount_90d='{$data[24]}',citystate='{$data[25]}',user_type='{$data[26]}',
    hpq='{$data[27]}',jgq='{$data[28]}',company_name='{$data[29]}',positive_last_2_month='{$data[30]}',
neutral_last_2_month='{$data[31]}',negative_last_2_month='{$data[32]}',nofeedback_rate='{$data[33]}'  where supplierid = '{$data[0]}'";
echo $updateSql;exit;            
$res = mysql_query($updateSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'修改成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'修改失败<br />';
            }
        }
//        if($row>=10){
//            break;
//        }
    }
    fclose($handle);
}

function readOrderCsv($csvFile)
{
    $handle = fopen($csvFile,"r");
    $row = 0;

    while ($data = fgetcsv($handle, 20000, ",")) {
        $num = count($data);
        echo "<p> $num fields in line $row: <br>\n";

        $row++;
        $str = '';
        for ($c=0; $c < $num; $c++) {
            $data[$c] = iconv("gb2312", "utf-8", trim($data[$c]));
            $data[$c] = mysql_real_escape_string($data[$c]);
            $str .= "'$data[$c]',";
//            echo $data[$c] . "<br>\n";
        }
        $str = rtrim($str,',');
        
        if($row ==1){
            continue;
        }
//        print_r($data);
        // 判断是否重复，不重复就插入数据
        $sql ="SELECT * FROM td_scrm_user WHERE supplierid = '{$data[0]}'";
        $query = mysql_query($sql);
        $userInfo = mysql_fetch_array($query);
        if(!$userInfo){ // 不存在才进行插入
            $insertSql = "
INSERT INTO td_scrm_user (supplierid,confirmorder_1d,confirmorder_1w,confirmorder_7d,confirmorder_1m,clickprodcount_1d,clickprodcount_1w,
clickprodcount_7d,clickprodcount_1m,clickprodcount_30d,clickprodcount_3m,clickprodcount_90d,solditem_1d,solditem_1w,
solditem_7d,solditem_1m,solditem_30d,solditem_3m,solditem_90d,confirmorder_30d,confirmorder_3m,
confirmorder_90d,confirmgmv_1d,confirmgmv_1w,confirmgmv_7d,confirmgmv_1m,confirmgmv_30d,confirmgmv_3m,confirmgmv_90d,
recinyqty,inyresspeed,freeshippingpro) 
values({$str})";
//        echo $insertSql;
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'插入成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'插入失败<br />';
            }
        }else{//进行数据修改
            $updateSql ="UPDATE td_scrm_user set confirmorder_1d='{$data[1]}',confirmorder_1w='{$data[2]}',confirmorder_7d='{$data[3]}',
confirmorder_1m='{$data[4]}',clickprodcount_1d='{$data[5]}',clickprodcount_1w='{$data[6]}',
clickprodcount_7d='{$data[7]}',clickprodcount_1m='{$data[8]}',clickprodcount_30d='{$data[9]}',clickprodcount_3m='{$data[10]}',
clickprodcount_90d='{$data[11]}',solditem_1d='{$data[12]}',solditem_1w='{$data[13]}',
solditem_7d='{$data[14]}',solditem_1m='{$data[15]}',solditem_30d='{$data[16]}',solditem_3m='{$data[17]}',
solditem_90d='{$data[18]}',confirmorder_30d='{$data[19]}',confirmorder_3m='{$data[20]}',
confirmorder_90d='{$data[21]}',confirmgmv_1d='{$data[22]}',confirmgmv_1w='{$data[23]}',confirmgmv_7d='{$data[24]}',
    confirmgmv_1m='{$data[25]}',confirmgmv_30d='{$data[26]}',confirmgmv_3m='{$data[27]}',confirmgmv_90d='{$data[28]}',
recinyqty='{$data[29]}',inyresspeed='{$data[30]}',freeshippingpro='{$data[31]}'  where supplierid = '{$data[0]}'";
       
$res = mysql_query($updateSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'修改成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'修改失败<br />';
            }
        }
//        if($row>=10){
//            break;
//        }
    }
    fclose($handle);
}

function readGmvCsv($csvFile)
{
    $handle = fopen($csvFile,"r");
    $row = 0;

    while ($data = fgetcsv($handle, 20000, ",")) {
        $num = count($data);
        echo "<p> $num fields in line $row: <br>\n";

        $row++;
        $str = '';
        for ($c=0; $c < $num; $c++) {
            $data[$c] = iconv("gb2312", "utf-8", trim($data[$c]));
            $data[$c] = mysql_real_escape_string($data[$c]);
            $str .= "'$data[$c]',";
//            echo $data[$c] . "<br>\n";
        }
        $str = rtrim($str,',');
        
        if($row ==1){
            continue;
        }
//        print_r($data);
        // 判断是否重复，不重复就插入数据
        $sql ="SELECT * FROM td_scrm_user WHERE supplierid = '{$data[0]}'";
        $query = mysql_query($sql);
        $userInfo = mysql_fetch_array($query);
        if(!$userInfo){ // 不存在才进行插入
            $insertSql = "
INSERT INTO td_scrm_user (supplierid,startorder_1d,startorder_1w,startorder_7d,startorder_1m,startorder_30d,startorder_3m
,startorder_90d,startgmv_1d,startgmv_1w,startgmv_7d,startgmv_1m,startgmv_30d,startgmv_3m,startgmv_90d,repeatrate,
allbuyer,newbuyer,newbuyerorder,newbuyergmv,pay_order_rate,refund_refundgmv,cause_refundgmv,deliver_time) 
values({$str})";
//        echo $insertSql;
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'插入成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'插入失败<br />';
            }
        }else{//进行数据修改
            $updateSql ="UPDATE td_scrm_user set startorder_1d='{$data[1]}',startorder_1w='{$data[2]}',startorder_7d='{$data[3]}',
startorder_1m='{$data[4]}',startorder_30d='{$data[5]}',startorder_3m='{$data[6]}'
,startorder_90d='{$data[7]}',startgmv_1d='{$data[8]}',startgmv_1w='{$data[9]}',startgmv_7d='{$data[10]}',startgmv_1m='{$data[11]}',
startgmv_30d='{$data[12]}',startgmv_3m='{$data[13]}',startgmv_90d='{$data[14]}',repeatrate='{$data[15]}',
allbuyer='{$data[16]}',newbuyer='{$data[17]}',newbuyerorder='{$data[18]}',newbuyergmv='{$data[19]}',pay_order_rate='{$data[20]}',
    refund_refundgmv='{$data[21]}',cause_refundgmv='{$data[22]}',deliver_time='{$data[23]}'  where supplierid = '{$data[0]}'";
         
$res = mysql_query($updateSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'修改成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'修改失败<br />';
            }
        }
//        if($row>=10){
//            break;
//        }
    }
    fclose($handle);
}
