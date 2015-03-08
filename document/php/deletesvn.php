<?php
// 在进行删除的时候windows系统会提示没有权限删除时，需要把这个文件的权限的只读去掉，就可以删除了。
function delsvn($dir) {
    $dh = opendir($dir);
    /** 找出所有".svn“ 的文件夹： */
    while ($file = readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $dir . "/" . $file;
            if (is_dir($fullpath)) {
                if ($file == ".svn") {
                    $result = delsvndir($fullpath);
                    if($result)
                    {
                        echo 'Success<br />';
                    }else{
                        echo 'Failure<br />';
                    }
                } else {
                    delsvn($fullpath);
                }
            }
        }
    }
    closedir($dh);
}
 
function delsvndir($svndir) {
    /** 先删除目录下的文件： */
    $dh = opendir($svndir);
    while ($file=readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $svndir . "/" . $file;echo $fullpath.'<br>';
            if (is_dir($fullpath)) {
                delsvndir($fullpath);
            } else {
                unlink($fullpath)or die("Cannot delete file.");
            }
        }
 
    }
    closedir($dh);
    /** 删除目录文件夹 */
    if (rmdir($svndir)) {
        return  true;
    } else {
        return false;
    }
}
 
$dir = "D:\www/jinriliwu/1/trunk";
delsvn($dir);



?>
