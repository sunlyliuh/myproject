<?php
class Welcome extends Controller
{
    public function index()
    {
         $model = $this->LoadModel('test');  //载入模型
        $res    = $model->Query("SELECT * FROM user"); //查询表, 这里查询你有的表就行了
        $row    = $model->fetch($res);  //处理结果集返回数组
        print_r($row);       //打印出来
        
        echo 'Hello';
    }
    
    public function show()
    {
        echo '方法名称Show';
    } 
} 
