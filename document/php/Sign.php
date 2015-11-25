<?php
/**
 * api设计，签名算法
 * 
 1.签名算法 思路如下
假设参与参数签名计算的请求参数分别是"k1","k2","k3",他们的值分别是"v1","v2","v3",则参数签名计算方法如下
a.将请求参数格式化“key=value”格式，即“k1=v1","k2=v2","k3=v3"
b.将格式化好的参数键值对以字典序升序排列后，拼接在一起，即"k1=v1k2=v2k3=v3";
c.在拼接好的字符串末尾加上应用通过OAuth获取access token时所获取到的session_secret参数值
d.上数字符串的MD5值即为签名的值
 */

2.web签名验证
参考文档：http://www.cnblogs.com/chengmo/archive/2010/10/18/1854755.html
在进行api调用的时候需要第三方做如下处理
比如:需要根据用户名查询用户信息
传入参数：username,sign(数字签名)
数字签名的生成规则是：md5(username,key),里面的key是你和第三方约定的一个值，其他人不知道，这里如果是中文的话需要做编码的规范，统一用utf8格式

服务端验证的时候：获取对应的参数，验证签名sign是否正确，如果不正确有可能是其他人劫持的或者是错误的，给出提示

/**
  * 签名生成算法
  * @param  array  $params API调用的请求参数集合的关联数组，不包含sign参数
  * @param  string $secret 签名的密钥即获取access token时返回的session secret
  * @return string 返回参数签名值
  */
 function getSignature($params, $secret)
 {
    $str = '';  //待签名字符串
    //先将参数以其参数名的字典序升序进行排序
    ksort($params);
    //遍历排序后的参数数组中的每一个key/value对
    foreach ($params as $k => $v) {
        //为key/value对生成一个key=value格式的字符串，并拼接到待签名字符串后面
        $str .= "$k=$v";
    }
    //将签名密钥拼接到签名字符串最后面
    $str .= $secret;
    //通过md5算法为签名字符串生成一个md5签名，该签名就是我们要追加的sign参数值
    return md5($str);
 }
