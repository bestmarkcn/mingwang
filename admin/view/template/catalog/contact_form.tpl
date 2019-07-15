<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td>角色</td>
            <td><input type="text" name="juese" value="<?php echo $juese; ?>" />
            </td>
          </tr>
          <tr>
            <td>公司名稱</td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
            </td>
          </tr>
           </tr>
            <td>聯絡人姓名</td>
            <td><input type="text" name="contactor" value="<?php echo $contactor; ?>" />
            </td>
          </tr>
          <tr>
            <td>性別</td>
            <td><input type="text" name="sex" value="<?php echo $sex; ?>" />
            </td>
          </tr>
          <tr>
            <td>電話</td>
            <td><input type="text" name="phone" value="<?php echo $phone; ?>" />
            </td>      
          <tr>
            <td>EMAIL</td>
            <td><input type="text" name="email" value="<?php echo $email; ?>" />
            </td>
          </tr>
          <tr>
            <td><span class="required"></span> 聯絡地址</td>
            <td><textarea name="comments" cols="60" rows="2"><?php echo $address; ?></textarea>
          </td>
          <tr>
            <td><span class="required"></span> 訊息留言</td>
            <td><textarea name="comments" cols="60" rows="8"><?php echo $comments; ?></textarea>
          </td>
          </tr>
           <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'product\']').val(ui.item.label);
		$('input[name=\'product_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<?php echo $footer; ?>