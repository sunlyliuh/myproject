<?php
/**
 * 导出到csv文件
 * 使用方法如下
 * $csvCls = new csv();
 * $csvCls->addHeader(array('列1','列2','列3','列4'));
 * $csvCls->addBody(
            array(
                array('数据1','数据2','数据3','数据4'),
                array('数据1','数据2','数据3','数据4'),
                array('数据1','数据2','数据3','数据4'),
                array('数据1','数据2','数据3','数据4')
            )
        );
 * $csvCls->downLoad();
 * @author liuhui
 * @date 2015.07.13
 */
class Csv{
    private $head;
    private $body;
     
    /**
     * 添加导出的头
     * @param type $arr 一维数组
     */
    public function addHeader($arr){
        foreach($arr as $headVal){
            $headVal = $this->__charset($headVal);
            $this->head .= "{$headVal}, ";
        }
        $this->head .= "\n";
    }
     
    /**
     * 添加导出内容
     * @param type $arr 二维数组
     */
    public function addBody($arr){
        foreach($arr as $arrBody){
            foreach($arrBody as $bodyVal){
                $bodyVal = $this->__charset($bodyVal);
                $this->body .= "{$bodyVal}, ";
            }
            $this->body .= "\n";
        }
    }
     
    /**
     * 下载excel文件
     */
    public function downLoad($filename=''){
        if(!$filename)
            $filename = date('YmdHis',time()).'.csv';
        header("Content-type:text/csv");
//        header("Content-type:application/vnd.ms-excel");
        header("Content-Disposition:attachment;filename=$filename"); 
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header("Content-Type:charset=gb2312");
        if($this->head)
            echo $this->head;
        echo $this->body;
    }
     
    /**
     * 编码转换
     * @param type $string
     * @return string
     */
    private function __charset($string){
        return iconv("utf-8", "GBK//IGNORE", $string);
    }
}

$csvCls = new Csv();
$csvCls->addHeader(array('列1','列2','列3','列4'));
$csvCls->addBody(
          array(
              array('数据1','数据2','数据3','数据4'),
              array('数据1','数据2','数据3','数据4'),
              array('数据1','数据2','数据3','数据4'),
              array('数据1','数据2','数据3','数据4')
          )
      );
$csvCls->downLoad();



