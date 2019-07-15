
<form method="POST" action="<?php echo $action; ?>" accept-charset="utf-8" id="checkout">
 
		<input type="hidden" name="MID" value="<?php echo $MID; ?>"> <!--商店代號 maxlength="10" -->
		<input type="hidden" name="CID" value="<?php echo $CID ?>"> <!--子特店代號 -->
		<input type="hidden" name="TID" value="<?php echo $TID ?>"> <!--EC000001(一般交易)、EC000002(分期) -->
		<input type="hidden" name="ONO" value="<?php echo  $order_id;?>"> <!-- 訂單編號-->
		<input type="hidden" name="TA" value="<?php echo  $amount;?>"> <!-- 交易金額 maxlength="8" -->
 	    <input type="hidden" name="U" value="<?php echo  $roturl;?>"> <!-- 由特約商店提供銀行端回傳授權結果所需使用的 URL，URL 不可包含【#】、【?】及【&】字元。 " -->
        <input type="hidden" name="M" value="<?php echo $M;  ?>"><!-- 押碼 -->
 		
  <div class="buttons">
    <div class="right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="button" />
    </div>
  </div>
 </form>

 
 