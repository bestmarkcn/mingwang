<?php echo $header; ?>

<div class="second-page">
<div class="container">
<ol class="breadcrumb">
     <?php foreach ($breadcrumbs as $key=>$breadcrumb) { ?>
    <li <?php if($key==0) echo 'class="home"'; ?>  > <span  class="space"><?php echo $breadcrumb['separator']; ?></span><a href="<?php echo $breadcrumb['href']; ?>" <?php if(($key+1)==count($breadcrumbs)) echo 'class="active"'; ?>  ><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>

</ol>
</div>
</div>
<div class="container sub-content" role="main">
<?php echo $column_right; ?>

<div class="cart">
<h2 class="headline">詢價車</h2>
<div class="main well clearfix">
<p class="note">請填好以下的詢問單，印樂網的服務人員會在最快的時間內與您聯繫! 若超過 1 天未接到回覆，請您撥0800-221-772客服專線與我們確認信件傳送，謝謝您!</p>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cart_form">

<h3 class="title">產品項目</h3>
<table class="table table-bordered">
<tr>
<th width="90">產 品 款 式</th>
<td>
<div class="box">
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio1" value="T恤" <?php  if($product_type=='T恤'){ echo 'checked="checked"';} ?> /> T恤
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio2" value="Polo衫" <?php  if($product_type=='Polo衫'){ echo 'checked="checked"';} ?> /> Polo衫
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="帽子" <?php  if($product_type=='帽子'){ echo 'checked="checked"';} ?>/> 帽子
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="頭巾" <?php  if($product_type=='頭巾'){ echo 'checked="checked"';} ?> /> 頭巾
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="外套" <?php  if($product_type=='外套'){ echo 'checked="checked"';} ?> /> 外套
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="祭典服" <?php  if($product_type=='祭典服'){ echo 'checked="checked"';} ?> /> 祭典服
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="馬克杯" <?php  if($product_type=='馬克杯'){ echo 'checked="checked"';} ?> /> 馬克杯
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="運動服" <?php  if($product_type=='運動服'){ echo 'checked="checked"';} ?> /> 運動服
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="Babysuit" <?php  if($product_type=='Babysuit'){ echo 'checked="checked"';} ?> /> Babysuit
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="袋子" <?php  if($product_type=='袋子'){ echo 'checked="checked"';} ?> /> 袋子
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="抱枕" <?php  if($product_type=='抱枕'){ echo 'checked="checked"';} ?> /> 抱枕
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="旗幟" <?php  if($product_type=='旗幟'){ echo 'checked="checked"';} ?> /> 旗幟
</label>
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="背心" <?php  if($product_type=='背心'){ echo 'checked="checked"';} ?> /> 背心
</label>
</div>
<div class="box">
<label class="radio-inline">
<input type="radio" name="product_type" id="inlineRadio3" value="其它產品" <?php  if($product_type=='其它產品'){ echo 'checked="checked"';} ?> /> 其它產品
</label>
<div class="type-other"><input type="text" name="other_type" class="form-control" value="<?php echo $other_type ?>" /></div>
</div>
</td>
</tr>
<tr>
<th width="90">圖 檔 上 傳</th>
<td class="pc-upload">
<div class="box clearfix">
<span class="item-name">我有圖檔要上傳 </span>
<div class="fileUpload btn">
  <a class="upload" id="uploadBtn"  >選擇文件</a>
 </div>
<input id="uploadFile" name="uploadFile" placeholder="未選擇文件"   disabled="disabled" class="input-area" value="" />
<span class="note-text pull-right">( 上限 2Mbytes，若檔案超過此大小，請使用 e-mail 或是 FTP 或與客服人員聯絡 )</span>
<div class="clearfix"></div>
<div class="upload_files">
<?php
  foreach($upload_files as $file){ ?>

<div><input type="hidden" value="<?php  echo $file ?>"  name="upload_files[]" /><a target="_blank" href="download/upload/<?php  echo $file ?>"><?php  echo $file ?></a> <a href="javascript:void(0)" onclick="$(this).parent().remove()">刪除</a></div>

<?php } ?> 
</div>

<div class="box clearfix">
<span class="item-name">預估數量：</span>
約<div class="input-box" style=" width:100px;"><input name="order_qty" type="text" class="form-control"  value="<?php echo $order_qty ?>" /></div>件
<span class="note-text pull-right">(各種印法最低數量不同，基本量為膠膜五件以上)</span>
</div>

<div class="box">
<span class="item-name">預估時間：</span>
<label class="radio-inline">
<input type="radio" name="order_time" id="inlineRadio1"  value="趕件"  <?php  if($order_time=='趕件'){ echo 'checked="checked"';} ?>  /> 趕件
</label>

</div>

<div class="box">
<label class="radio-inline">
<input type="radio"  name="order_time" id="inlineRadio1" value="正常出貨即可" <?php  if($order_time=='正常出貨即可'){ echo 'checked="checked"';} ?> /> 正常出貨即可
</label>

</div>

<div class="box">
<label class="radio-inline">
  希望收到日期
</label>
<div class="input-box" style=" width:60px;"><input name="shipping_month" type="text" class="form-control"  value="<?php echo $shipping_month ?>" /></div>
月
<div class="input-box" style=" width:60px;"><input name="shipping_day" type="text" class="form-control"  value="<?php echo $shipping_day ?>" /></div>
日前
</div>

</td>
</tr>
</table>

<h3 class="title">客戶資料</h3>
<table class="table table-bordered custom">
<tr>
<th width="120">希望服務區域</th>
<td colspan="3">
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="台北店" <?php  if($shop_area=='台北店'){ echo 'checked="checked"';} ?> />台北店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="新竹店" <?php  if($shop_area=='新竹店'){ echo 'checked="checked"';} ?> >新竹店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="台中店" <?php  if($shop_area=='台中店'){ echo 'checked="checked"';} ?> >台中店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="高雄店" <?php  if($shop_area=='高雄店'){ echo 'checked="checked"';} ?> >高雄店
</label>
<label class="radio-inline">
<input type="radio" name="shop_area" id="inlineRadio1" value="電話網路服務" <?php  if($shop_area=='電話網路服務' || $shop_area=='' ){ echo 'checked="checked"';} ?> >電話網路服務  
</label>
</td>
</tr>
<tr>
<th width="120">希望服務方式</th>
<td colspan="3">
請選擇您希望的連絡方式：
<label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="email" checked="checked" <?php  if($service_type=='email' || $service_type==''){ echo 'checked="checked"';} ?> >電子郵件
</label>
<label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="telephone" <?php  if($service_type=='telephone'){ echo 'checked="checked"';} ?> >電話
</label>
<label class="radio-inline">
<input type="radio" name="service_type" id="inlineRadio1" value="english" <?php  if($service_type=='english'){ echo 'checked="checked"';} ?> >English service
</label>
</td>
</tr>
<tr>
<th width="120">聯絡人 <span class="requirt">(必填)</span></th>
<td><input type="text" class="form-control" name="name" value="<?php echo $name ?>">
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>

</td>
<th width="120">聯絡電話 <span class="requirt">(必填)</span></th>
<td><input type="text" class="form-control" name="phone" value="<?php echo $phone ?>">
    <br />
    <?php if ($error_phone) { ?>
    <span class="error"><?php echo $error_phone; ?></span>
    <?php } ?>

</td>
</tr>
<tr>
<th width="120">公司/單位/校系</th>
<td><input type="text" class="form-control" name="company" <?php echo $company ?>></td>
<th width="120">E-mail <span class="requirt">(必填)</span></th>
<td><input type="text" class="form-control" name="email" value="<?php echo $email ?>" >
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>

</td>
</tr>
<tr>
<th width="120">傳真號碼 </th>
<td><input type="text" class="form-control" name="fax" value="<?php echo $fax ?>">
 </td>
<th width="120">公司統編  </th>
<td><input type="text" class="form-control" name="union_no" value="<?php echo $union_no ?>">
 </td>
</tr>
<tr>
<th width="120">地址 </th>
 <td colspan="3"><input type="text" class="form-control" name="address" value="<?php echo $address ?>">
 </td>
 </tr>
</table>

<h3 class="title">估價需求</h3>
<table class="table table-bordered prod-table">
<thead>
<tr>
<td width="50">項次</td>
<td width="290">產品款式</td>
<td width="180">供應材質與特色</td>
<td width="120">供應尺寸</td>
<td width="170">顏色選擇</td>
<td width="90">數量</td>
<td width="">附檔</td>
</tr>
</thead>
<tbody>
<?php $i=1; foreach ($products as $key=>$product) { ?>
 <tr>
<td class="text-center"><?php  echo $i++ ?></td>
<td class="prod-name"><a href="index.php?route=product/product&product_id=<?php  echo $product['product_id']  ?>"><?php  echo  $product['name']  ?></a>
<input type="hidden" name="products[<?php echo $i?>][name]" class="form-control" value="<?php  echo $product['name']  ?>">
<input type="hidden" name="products[<?php echo $i?>][product_id]" class="form-control" value="<?php  echo $product['product_id']  ?>">
</td>
<td><input type="text" name="products[<?php echo $i?>][feature]"  class="form-control" value="<?php  echo $product['feature'];  ?>"></td>
<td><input type="text" class="form-control"  name="products[<?php echo $i?>][size]"   value="<?php  echo $product['size'];  ?>"></td>
<td>
<?php if(empty($product['color_image'])){?>
<span class="colorbox" style="background:<?php  echo $product['color_code']; ?>"></span>
<?php }else{ ?>
 <img class="colorbox" src="<?php  echo HTTP_IMAGE.$product['color_image']; ?>">
<?php } ?>
<?php  echo $product['color_name']; ?>
<input type="hidden" name="products[<?php echo $i?>][color_id]" class="form-control" value="<?php  echo $product['color_id']; ?>">
<input type="hidden" name="products[<?php echo $i?>][color_name]" class="form-control" value="<?php  echo $product['color_name']; ?>">
<input type="hidden" name="products[<?php echo $i?>][color_code]" class="form-control" value="<?php  echo $product['color_code']; ?>">
<input type="hidden" name="products[<?php echo $i?>][color_image]" class="form-control" value="<?php  echo $product['color_image']; ?>">
<input type="hidden" name="products[<?php echo $i?>][design_image]" class="form-control" value="<?php  echo $product['design_image']; ?>">
<input type="hidden" name="products[<?php echo $i?>][upload_file]" class="form-control" value='<?php  echo $product['upload_file']; ?>'>

</td>
<td><input type="text" name="products[<?php echo $i?>][quantity]" class="form-control" value="<?php  echo $product['quantity']; ?>"></td>
<td><a target="_blank" href="<?php  echo $product['design_image']; ?>" class="btn"><i class="glyphicon glyphicon-picture"></i></a><a href="index.php?route=checkout/cart&remove=<?php echo $key; ?>" class="btn"> <i class="glyphicon glyphicon-remove"></i></a></td>
</tr>
<?php } ?>
  </tbody>
</table>

<div class="note">歡迎您把想詢問的事情寫在這裡，如需要印樂網Fb粉絲團的免費宣傳，也請寫在詢問內容中唷~^^</div>

<table class="table table-bordered code">
<tr>
<th width="120">詢問內容 <span class="requirt">(必填)</span></th>
<td><textarea class="form-control" name="enquiry" style=" height:120px;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>

</td>
</tr>
<tr>
<th width="120">驗  證  碼</th>
<td>
<div class="input-box"><input type="text" class="form-control" name="captcha" value="<?php echo $captcha; ?>"></div>
  <img src="index.php?route=checkout/cart/captcha" alt="" onclick="this.src='index.php?route=checkout/cart/captcha'" />

<span class="note-text">請輸入左邊文字，需注意大小寫</span>
     <br />
<?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
 <?php } ?>
</td>
</tr>
</table>

<div class="btn-area">
<a href="javascript:void(0)" class="btn-submit" onclick="$('#cart_form').submit()"><i class="icon"></i>送出估價單</a>
<a href="#" class="btn-reset">取消重填</a>

</div>
</form>
<div class="btm">我們會用最快的速度回信給您！如您在24小時內沒接到我們客服天使的電話（例假日除外），麻煩請您電話告知我們，並再次送出詢問單。<br>
請您幫忙將我們的信箱（080@myif.net 以及 service@myif.net）加入好友名單，以避免Yahoo或其他的信箱會有擋信（被分到信件垃圾桶）與退信的情況！<br>
請務必多留意喔，謝謝您的幫忙 ^_^</div>

</div>
</div>
</div>

<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script> 
<script type="text/javascript"> 
new AjaxUpload('#uploadBtn', {
	action: 'index.php?route=checkout/cart/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#uploadBtn').after('<img src="images/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#uploadBtn').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#uploadBtn').attr('disabled', false);
		
		if (json['success']) {
			 //alert(json['success']);
			$('.upload_files').append('<div><input type="hidden" value="'+ json['filename']+'"  name="upload_files[]" /><a target="_blank" href="download/upload/'+json['filename']+'">'+ json['filename']+'</a> <a href="javascript:void(0)" onclick="$(this).parent().remove()">刪除</a></div>');
			//$('input[name=\'upload_file\']').attr('value', json['filename']);
 		}
 		if (json['error']) {
			alert(json['error']);
		}
 		$('.loading').remove();	
	}
});
</script>
<?php echo $footer; ?>
