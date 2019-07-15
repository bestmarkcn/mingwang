
<form method="POST" action="<?php echo $action; ?>" accept-charset="utf-8" id="checkout">
 
		<input type="hidden" name="IcpNo" value="<?php echo $webatm_merchant; ?>"> <!--商店代號 maxlength="10" -->
		<?php if(!empty($webatm_account)){ ?>
		<input type="hidden" name="VAccNo" value="<?php echo  $webatm_account;?>"> <!-- 虛擬帳號 maxlength="30"-->
		<?php } ?>
	    <input type="hidden" name="IcpConfirmTransURL" value="<?php echo  $roturl;?>"> <!-- 商家確認交易處理網頁" -->
		<input type="hidden" name="TransNo" value="<?php echo  $order_id;?>"> <!-- 訂單編號-->
		<input type="hidden" name="TransAmt" value="<?php echo  $amount;?>"> <!-- 交易金額 maxlength="8" -->
        <input type="hidden" name="TransDesc" value="<?php echo  $first_name.'('.$email.')';?>"> <!-- 訂單摘要 -->
		<input type="hidden" name="StoreName" value="<?php  echo $store_name; ?>"> <!-- [消費地點]即 ICP名稱 -->
        <input type="hidden" name="TransIdentifyNo" value="<?php echo $TransIdentifyNo;  ?>"><!-- 交易資訊識別碼 -->
 		<!--<input type="hidden" name="ReturnURL" value="<?php echo  $roturl;?>">--> <!-- 商家自訂回上頁網址 -->
     	<!--<input type="hidden" name="UserEmail" value="<?php echo  $email;?>">--> <!-- email maxlength="100" -->
		
  <div class="buttons">
    <div class="right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="button" />
    </div>
  </div>
 </form>

 
 