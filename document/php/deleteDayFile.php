<?php
/**

 * 删除指定文件夹内，几天前的文件，支持递归删除
 */


$fileDir = 'E:\php5';

function bianliDelete($fileDir) {
    $fewDays = 5;
    if (!is_dir($fileDir))
        return;
    if ($handle = opendir($fileDir)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != '.' && $file != '..') {
                if (is_dir($fileDir . '/' . $file)) {
                    bianliDelete($fileDir . '/' . $file);
                } else {
                    // 判断文件的日期是否大于几天前的日期，大于就删除
                    $fileFullPath = $fileDir.'/'.$file;
                    $fileCreateTime = filemtime($fileFullPath);
                    $nowTime = time();
                    $diffTime = $nowTime - $fileCreateTime;
                    $resultTime = $fewDays * 24 * 3600;
                    if ($diffTime > $resultTime) {
                        unlink($fileDir . '/' . $file);
                        echo "文件".$fileFullPath."删除成功<br />";
                    } else {
                        echo "文件".$fileFullPath."不需要删除<br />";
                    }
                }
            }
        }
    }
    closedir($handle);
}

bianliDelete($fileDir);

