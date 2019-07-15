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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a   href="<?php echo $insert; ?>" class="  hide"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td class="left">報價單號</td>
               <td class="left"><?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_product; ?>" class="<?php echo strtolower($order); ?>">姓名</a>
                <?php } else { ?>
                <a href="<?php echo $sort_product; ?>">姓名</a>
                <?php } ?></td>
              <td class="left">電話</td>
              <td class="right">EMAIL</td>
              <td class="right">留言</td>
              <td class="left"><?php if ($sort == 'r.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'r.date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">新增日期</a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>">新增日期</a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
               <td><input type="text" name="filter_inquiry_no" value="<?php echo $filter_inquiry_no; ?>" /></td>
               <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" size="10" /></td>
              <td><input type="text" name="filter_phone" value="<?php echo $filter_phone; ?>" size="10" /></td>
              <td><input type="text" name="filter_email" value="<?php echo $filter_email; ?>"  size="15"/></td>
              <td width="20"> </td>
               <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected">已處理</option>
                  <?php } else { ?>
                  <option value="1">已處理</option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected">未處理</option>
                  <?php } else { ?>
                  <option value="0">未處理</option>
                  <?php } ?>
                </select></td>
               <td align="left"></td>
 			 <td align="right"><a onclick="filter(0);" class="button"><?php echo $button_filter; ?></a> &nbsp;<a onclick="filter(1);" class="button">匯出詢價單</a></td>

            </tr>
            <?php if ($inquirys) { ?>
            <?php foreach ($inquirys as $inquiry) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($inquiry['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $inquiry['inquiry_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $inquiry['inquiry_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $inquiry['inquiry_no']; ?></td>
              <td class="left"><?php echo $inquiry['name']; ?></td>
              <td class="left"><?php echo $inquiry['phone']; ?></td>
              <td class="right"><?php echo $inquiry['email']; ?></td>
              <td class="right"><?php echo $inquiry['enquiry']; ?></td>
              <td class="left"><?php echo $inquiry['status']; ?></td>
              <td class="left"><?php echo $inquiry['date_added']; ?></td>
              <td class="right"><?php foreach ($inquiry['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function filter(isoutput) {
 
  if(isoutput=='1'){
	url = 'index.php?route=catalog/inquiry/output&token=<?php echo $token; ?>';
  }else{
	url = 'index.php?route=catalog/inquiry&token=<?php echo $token; ?>';
  }
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_inquiry_no = $('input[name=\'filter_inquiry_no\']').attr('value');
	
	if (filter_inquiry_no) {
		url += '&filter_inquiry_no=' + encodeURIComponent(filter_inquiry_no);
	}
	
	var filter_phone = $('input[name=\'filter_phone\']').attr('value');
	
	if (filter_phone) {
		url += '&filter_phone=' + encodeURIComponent(filter_phone);
	}
	
	var filter_email = $('input[name=\'filter_email\']').attr('value');
	
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}	
 
 
	location = url;
}
//--></script> 

<?php echo $footer; ?>