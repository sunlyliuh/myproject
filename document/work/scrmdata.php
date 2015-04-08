<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<?php
set_time_limit(0);

$conn = mysql_connect("localhost", "root", "root") or die('connect error');
mysql_select_db("test", $conn);
 mysql_query("set names 'utf8'");

$csvArr = array('2206-1.csv');

foreach($csvArr as $csvFile)
{
    readBasicCsv('./data/'.$csvFile);
}

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
        $userInfo = mysql_fetch_array($query);
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
            }
        }
        if($row>=10){
            break;
        }
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
            $value = iconv("gb2312", "utf-8", trim($data[$c]));
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
        $userInfo = mysql_fetch_array($query);
        if(!$userInfo){ // 不存在才进行插入
            $insertSql = "
INSERT INTO td_scrm_user (logincount_1d,logincount_1w,uploadprods,auditprods,livelisting,searchprodcount_1d,searchprodcount_1w,
searchprodcount_7d,dayonlinetime_1d,dayonlinetime_1w,logincount_7d,dayonlinetime_7d,logincount_1m,dayonlinetime_1m,logincount_30d,
dayonlinetime_30d,logincount_3m,dayonlinetime_3m,logincount_90d,dayonlinetime_90d,searchprodcount_1m,searchprodcount_30d,
searchprodcount_3m,searchprodcount_90d,citystate,user_type,hpq,jgq,company_name,positive_last_2_month,
neutral_last_2_month,negative_last_2_month,nofeedback_rate) 
values({$str})";
//        echo $insertSql;
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'插入成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'插入失败<br />';
            }
        }else{//进行数据修改
            $updateSql ="UPDTE td_scrm_user set logincount_1d='{$data[1]}',logincount_1w,uploadprods,auditprods,livelisting,searchprodcount_1d,searchprodcount_1w,
searchprodcount_7d,dayonlinetime_1d,dayonlinetime_1w,logincount_7d,dayonlinetime_7d,logincount_1m,dayonlinetime_1m,logincount_30d,
dayonlinetime_30d,logincount_3m,dayonlinetime_3m,logincount_90d,dayonlinetime_90d,searchprodcount_1m,searchprodcount_30d,
searchprodcount_3m,searchprodcount_90d,citystate,user_type,hpq,jgq,company_name,positive_last_2_month,
neutral_last_2_month,negative_last_2_month,nofeedback_rate  where supplierid = '{$data[0]}'";
            $res = mysql_query($insertSql);
            if($res){
                echo $num.'--用户supplierid：'.$data[0].'修改成功<br />';
            }else{
                echo $num.'--用户supplierid：'.$data[0].'修改失败<br />';
            }
        }
        if($row>=10){
            break;
        }
    }
    fclose($handle);
}
