<?php
$taoUrl = 'http://item.taobao.com/item.htm?spm=a219r.lm5082.14.1.0OaavE&id=23636544056&ns=1&abbucket=15#detail';
include 'snoopy.class.php';
$snoopy = new Snoopy();

$url = $taoUrl;


$snoopy->proxy_host = "http://www.jb51.net"; 
$snoopy->proxy_port = "80"; 
$snoopy->agent = "(compatible; MSIE 4.01; MSN 2.5; AOL 4.0; Windows 98)"; 
$snoopy->referer = "http://www.jb51.net"; 
$snoopy->cookies["SessionID"] = "238472834723489l"; 
$snoopy->cookies["favoriteColor"] = "RED"; 
$snoopy->rawheaders["Pragma"] = "no-cache"; 
$snoopy->maxredirs = 2; 
$snoopy->offsiteok = false; 
$snoopy->expandlinks = false; 
$snoopy->user = "joe"; 
$snoopy->pass = "bloe"; 
if($snoopy->fetchtext($url)) 
{ 
echo "<PRE>".htmlspecialchars($snoopy->results)."</PRE>\n"; 
} 
else 
echo "error fetching document: ".$snoopy->error."\n"; 

