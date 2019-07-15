<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>聯絡我們</title>
</head>

<body>
<table cellspacing="0" cellpadding="0" border="0" style="margin:0 auto; font-size:13px; font-family:Arial, 'Microsoft JhengHei', Helvetica, sans-serif; line-height:20px;">
  <tr>
    <td colspan="2" style="background-image: linear-gradient(to bottom,#fff 0,#F8F7F5 100%); border:1px solid #CCCCCC ; line-height:48px;padding:10px; font-weight:bold; font-size:24px; color:#181712;  vertical-align:middle;border-top: 3px solid #AAA; text-align:center; position:relative; "> 聯絡我們</td>
  </tr>
    <tr>
    <td  colspan="2" width="171" style="padding:5px 10px 0;border-left:1px solid #ccc; background:#eee;">日期：<?php  echo date('Y-m-d') ?></td>
   </tr>

   <tr>
    <td colspan="2" style="border:1px solid #ccc; border-bottom:none;"> 

<table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr>
    <td colspan="4" width="200" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px;">角　　色：<?php echo $juese; ?></td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px;">性別：<?php echo $sex; ?></td>
  </tr>
  <tr>
    <td colspan="4" width="200" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px;">公司名稱：<?php echo $name; ?></td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px;">聯絡人姓名：<?php echo $contactor; ?></td>
  </tr>
  <tr>
    <td colspan="4" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px;">電　　話：<?php echo $phone; ?></td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px;">電子郵箱：<?php echo $email; ?></td>
  </tr>
  <tr>
  <tr>
    <td colspan="8" style="border-bottom:1px solid #ccc; padding:5px 10px;">聯絡地址：<?php echo $address; ?></td>
  </tr>
  <tr>
    <td colspan="8" style="border-bottom:1px solid #ccc; padding:5px 10px;">訊息留言：</td>
  </tr>
  <tr>
  <td colspan="8" style="border-bottom:1px solid #ccc; padding:5px 10px;"><?php echo $comments; ?></td>
  </tr>
</table>
</td>
</tr>
  <tr>
    <td colspan="2" style="background: #666;color: #fff;padding: 15px 0;line-height: 18px;font-size: 12px; text-align:center;">© 2013 - <?php echo date('Y'); ?>  <?php echo $config_name ?>. All rights reserved. Power by 元伸網頁設計</td>
  </tr>
</table>
</body>
</html>
