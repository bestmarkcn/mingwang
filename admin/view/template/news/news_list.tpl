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
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
               <td class="left">分類</td>
               <td class="left"><?php if ($sort == 'id.title') { ?>
                <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                <?php } ?></td>
                <td class="left">推薦首頁</td>
             <td class="right"><?php if ($sort == 'i.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
		  
		      <tr class="filter">
              <td></td>
              <td><select name="filter_news_type_id">
			          <option value=""></option>
  				  <?php foreach ($news_types as $news_type) { ?>
                  <option value="<?php echo $news_type['news_type_id']; ?>" <?php if($filter_news_type_id==$news_type['news_type_id']) echo 'selected="selected"'; ?> ><?php echo $news_type['title']; ?></option>
                    <?php } ?>
                </select></td>
               <td><input type="text" name="filter_title" value="<?php echo $filter_title; ?>" /></td>
               <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
               <td></td>
             <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>

            <?php if ($newss) { ?>
            <?php foreach ($newss as $news) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($news['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $news['news_type']; ?></td>
              <td class="left"><?php echo $news['title']; ?></td>
              <td class="left"><?php echo $news['status']; ?></td>
               <td class="right"><input onchange="AjaxChange('news','sort_order','news_id','<?php echo $news['news_id']; ?>','<?php echo $news['sort_order']; ?>',this,'<?PHP   echo $token;?>')" name="sort_order[]" value="<?php echo $news['sort_order']; ?>" size="4" />
 </td>
             <td class="right"><?php foreach ($news['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
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
function filter() {
	url = 'index.php?route=news/news&token=<?php echo $token; ?>';
	
	var filter_title = $('input[name=\'filter_title\']').attr('value');
	
	if (filter_title) {
		url += '&filter_title=' + encodeURIComponent(filter_title);
	}
	
	var filter_news_type_id = $('select[name=\'filter_news_type_id\']').attr('value');
	
	if (filter_news_type_id) {
		url += '&filter_news_type_id=' + encodeURIComponent(filter_news_type_id);
	}
	
 	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 

<?php echo $footer; ?>