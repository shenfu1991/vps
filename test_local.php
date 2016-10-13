<?php
    // ▒~N▒▒~O~V▒~O~B▒~U▒
    $cip = $_GET['cip'];
    
    $url = "http://api.map.baidu.com/highacciploc/v1?qcip=".$cip."&qterm=pc&ak=WBAeXsAUPdhTGGpyRNhq4Mq66MpzkL0M&coord=bd09ll";
    
    // 请▒~B▒~F~E容
    $content_sting = file_get_contents($url);
    
    // echo "var result = $content_sting;";
    
    
    if (!file_exists('ip.txt')) {
        
        $fp = fopen('ip.txt', 'a');
        echo fwrite($fp, $content_sting);
        fclose($fp);
        
    }else{
        $fp = fopen('ip.txt', 'a');
        echo fwrite($fp, $content_sting);
        fclose($fp);
        
    }
    echo $content_sting;
    ?>
