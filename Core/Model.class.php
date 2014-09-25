<?php

class Model
{
    //数据库连接句柄
    protected $dbLink = NULL;
    
     /**
    * 构造器, 连接数据库
    *
    * @access public
    * @return void
    */
    public function __construct()
    {
      global $C;
      $this->dbLink = mysql_connect($C['DB_HOST'], $C['DB_USER'], $C['DB_PWD']) or exit(mysql_error());
      mysql_select_db($C['DB_NAME'], $this->dbLink) or exit(mysql_error());
      mysql_query("SET NAMES {$C['DB_CHAR']}");
    }
    
    /**
      * 执行SQl命令
      *
      * @access public
      * @param  string  $sql
      * @return resource
      */
    public function Query($sql)
    {
      $res = mysql_query($sql) or exit(mysql_error());
      return $res;
    }
    
    /**
      * 执行SQl命令,返回是否执行成功
      *
      * @access public
      * @param  string  $sql
      * @return bool
      */
    public function Execute($sql)
    {
      if(mysql_query($sql))
      {
       return TRUE;
      }
      return FALSE;
    }
    
    /**
      * 返回处理后的结果集
      *
      * @access public
      * @param  resource $res 结果集
      * @return mixed
      */
    public function Fetch($res, $type = 'array')
    {
      $func = $type == 'array' ? 'mysql_fetch_array' : 'mysql_fetch_object';
      $row  = $func($res);
      return $row;
    }
}
?>
