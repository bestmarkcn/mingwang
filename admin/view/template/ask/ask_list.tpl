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
              <td class="hide"><?php if ($sort == 'i.sort_order') { ?>
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
              <td><select name="filter_ask_type_id">
              <?php foreach ($aks_types as $aks_types_v) { ?>
                  <option value="<?php echo $aks_types_v['ask_type_id']; ?>" <?php if($filter_ask_type_id==$aks_types_v['ask_type_id']) echo 'selected="selected"'; ?> ><?php echo $aks_types_v['title']; ?></option>
                    <?php } ?>
                </select></td>
               <td><input type="text" name="filter_title" value="<?php echo $filter_title; ?>" /></td>
               <td class="hide"><select name="filter_status">
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
               <td class="hide">年份篩選：<input type="text" name="filter_year" value="<?php echo $filter_year; ?>" /></td>
             <td align="right"><a onclick="filter();" class="button">篩選</a></td>
            </tr>
            <?php if ($asks) { ?>
            <?php foreach ($asks as $ask) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($ask['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $ask['ask_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $ask['ask_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $ask['ask_type']; ?></td>
              <td class="left"><?php echo $ask['title']; ?></td>
              <td class="hide"><input onchange="AjaxChange('ask','sort_order','ask_id','<?php echo $ask['ask_id']; ?>','<?php echo $ask['sort_order']; ?>',this,'<?PHP   echo $token;?>')" name="sort_order[]" value="<?php echo $ask['sort_order']; ?>" size="4" /> </td>
              <td class="right"><?php foreach ($ask['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
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
  url = 'index.php?route=ask/ask&token=<?php echo $token; ?>';
  
  var filter_title = $('input[name=\'filter_title\']').attr('value');
  
  if (filter_title) {
    url += '&filter_title=' + encodeURIComponent(filter_title);
  }
  var filter_year = $('input[name=\'filter_year\']').attr('value');
  
  if (filter_year) {
    url += '&filter_year=' + encodeURIComponent(filter_year);
  }
  
  var filter_ask_type_id = $('select[name=\'filter_ask_type_id\']').attr('value');
  
  if (filter_ask_type_id) {
    url += '&filter_ask_type_id=' + encodeURIComponent(filter_ask_type_id);
  }
  
  
  var filter_status = $('select[name=\'filter_status\']').attr('value');
  
  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status);
  } 

  location = url;
}
//--></script> 
<?php echo $footer; ?>