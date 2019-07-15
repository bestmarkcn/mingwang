<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>報    價    單	</title>
</head>

<body>
<table cellspacing="0" cellpadding="0" border="0" style="margin:0 auto; font-size:13px; font-family:Arial, 'Microsoft JhengHei', Helvetica, sans-serif; line-height:20px;">
  <tr>
    <td colspan="2" style="background-image: linear-gradient(to bottom,#fff 0,#F8F7F5 100%); border:1px solid #CCCCCC ; line-height:48px;padding:10px; font-weight:bold; font-size:24px; color:#181712;  vertical-align:middle;border-top: 3px solid #AAA; text-align:center; position:relative; "><img src="<?php echo HTTP_SERVER; ?>../images/logo.png"  border="0" style=" position:absolute; height:48px; margin-right:20px; left:10px;"/>報    價    單	</td>
  </tr>
    <tr>
    <td width="171" style="padding:5px 10px 0;border-left:1px solid #ccc; background:#eee;">日期 Date：<?php echo date('y年m月d日') ?></td>
    <td style="padding:5px 10px 0; text-align:right;border-right:1px solid #ccc; background:#eee;">報價號碼 Quotation No. : <?php  echo $inquiry_no; ?></td>
  </tr>

   <tr>
    <td colspan="2" style="border:1px solid #ccc; border-bottom:none;"> 

<table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr>
    <td colspan="4" width="265" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px;">客戶名稱：<?php  echo $company ?></td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px;">聯絡人：<?php  echo $name ?></td>
  </tr>
  <tr>
    <td colspan="4" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px;">電　　話：<?php  echo $phone ?></td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px;">傳　真：<?php  echo $fax ?></td>
  </tr>
  <tr>
    <td colspan="8" style="border-bottom:1px solid #ccc; padding:5px 10px;">公司地址：<?php  echo $address ?></td>
  </tr>
  <tr>
    <td colspan="8" style="border-bottom:2px solid #a0a0a0; padding:5px 10px;">公司統編：<?php  echo $union_no ?></td>
  </tr>
  <tr>
    <td width="28" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">項次</td>
    <td width="143" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">品 名 規 格　</td>
    <td width="27" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">顏色</td>
    <td width="27" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">尺寸</td>
    <td width="43" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">數 量</td>
    <td width="43" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center;">單 價</td>
    <td width="63" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px 5px 0; text-align:center;">金  額</td>
    <td width="59" style="border-bottom:1px solid #ccc;padding:5px;text-align:center">備   註</td>
  </tr>
  <?php foreach($inquiry_prices as $key=>$price){ ?>
  <tr>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $key+1; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $price['name']; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $price['color_name']; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $price['size']; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $price['quantity']; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"><?php  echo $price['price']; ?></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px 5px 0; text-align:right"><?php  echo $price['total']; ?> </td>
    <td style="border-bottom:1px solid #ccc; padding:5px; text-align:center">　</td>
  </tr>
  <?php } ?>
  <tr>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center"></td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">以下空白</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">　</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">　</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">　</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">　</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px 5px 0; text-align:right">　</td>
    <td style="border-bottom:1px solid #ccc; padding:5px; text-align:center">　</td>
  </tr>
   <tr>
    <td colspan="5" style="border-bottom:1px solid #ccc;padding:5px; text-align:right">合　計</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">(NTD)</td>
    <td style="border-bottom:1px solid #ccc;padding:5px 10px 5px 0; text-align:right"><?php  echo $sub_total; ?> </td>
    <td style="border-bottom:1px solid #ccc;padding:5px; text-align:center">　</td>
  </tr>
  <tr>
    <td colspan="5" style="border-bottom:1px solid #ccc;padding:5px; text-align:right">營業稅</td>
    <td style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px; text-align:center">(+5%)</td>
    <td style="border-bottom:1px solid #ccc;padding:5px 10px 5px 0; text-align:right"><?php  echo $tax; ?>  </td>
    <td style="border-bottom:1px solid #ccc;padding:5px; text-align:center">　</td>
  </tr>
  <tr>
    <td colspan="5" style="border-bottom:2px solid #a0a0a0;padding:5px; text-align:right">總　計</td>
    <td style="border-bottom:2px solid #a0a0a0;border-right:1px solid #ccc; padding:5px; text-align:center">(NTD)</td>
    <td style="border-bottom:2px solid #a0a0a0;padding:5px 10px 5px 0; text-align:right"><?php  echo $total; ?>  </td>
    <td style="border-bottom:2px solid #a0a0a0;padding:5px; text-align:center">　</td>
  </tr>
  <tr>
    <td colspan="8" style="border-bottom:2px solid #a0a0a0;padding:5px 10px;">
    <p>業務負責人:<?php echo $user_info['phone'].'  '.$user_info['firstname'].'  '.$user_info['mobile']; ?></p>
    <p>　　　　　　代印材質:客戶提供(免費提供測試)</p>
    <p>　　　　　　代印款式:客戶指定裁片位置</p>
    <p>　　　　　　印製: 全彩數位膠膜-1款 尺寸:W_____H_____(請填寫)</p>
    <p>　　　　　　出貨:大包裝含代寄運送</p>
    <p>　　　　　　交期:7-10天</p>
    <p> </p>
    <p>　　　　　　<span style="font-weight:bold; color:#000; font-size:15px;">備註:<?php  echo $comment; ?> </span></p>
    <p> </p>
    <p>　　　　  　匯款轉賬賬號：<?php  echo $vaccount; ?></p>
    <p>　　　　　　請於下單前預付3成訂金，若需代寄請於出貨前付清尾款**</p>
    <p>　　　　　　若確認無誤煩請簽名回傳.謝謝!</p>
    </td>
  </tr>
  <tr>
    <td colspan="4" style="border-bottom:1px solid #ccc;border-right:1px solid #ccc; padding:5px 10px; text-align:center; background:#f7f7f7">業務負責人簽章 (   Person in charge )
	<img src="<?php echo HTTP_SERVER.'../image/'.$user_info['image']; ?>"  border="0" style=" position:absolute; height:48px; margin-top:50px;  left:480px;  "/>
	</td>
    <td colspan="4" style="border-bottom:1px solid #ccc; padding:5px 10px; text-align:center; background:#f7f7f7">客戶確認 ( Customer   confirmation )</td>
  </tr>
  <tr>
    <td colspan="4" rowspan="2" style="border-right:1px solid #ccc; padding:5px 10px; height:120px;">　</td>
    <td colspan="4" rowspan="2" style="padding:5px 10px; vertical-align:top"><span style=" font-size:12px; letter-spacing:-0.1px; color:#999">客戶確認後請簽名回傳，方可排入生產，謝謝。</span></td>
  </tr>
</table>
</td>
</tr>
  <tr>
    <td colspan="2" style="background: #666;color: #fff;padding: 15px 0;line-height: 18px;font-size: 12px; text-align:center;">© 2010 - 2014 myif印樂網. All rights reserved. Power by 元伸網頁設計</td>
  </tr>
</table>
</body>
</html>
