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
      <h1><img src="view/image/information.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><!-- <a href="#tab-data"><?php echo $tab_data; ?></a> --> </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
                <td><span class="required">*</span> <?php echo $entry_title; ?></td>
                <td><input type="text" name="ask_description[<?php echo $language['language_id']; ?>][title]" size="100" value="<?php echo isset($ask_description[$language['language_id']]) ? $ask_description[$language['language_id']]['title'] : ''; ?>" />
                  <?php if (isset($error_title[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
              <tr class="hide">
                <td><span class="required">*</span> <?php echo $entry_description; ?></td>
                <td><textarea name="ask_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($ask_description[$language['language_id']]) ? $ask_description[$language['language_id']]['description'] : ''; ?></textarea>
                  <?php if (isset($error_description[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                  <?php } ?></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        </div>
        <div >
          <table class="form" id="attribute">
            <?php if($this->request->get['ask_type_id']==10 || $this->request->get['ask_type_id']==11 || $this->request->get['ask_type_id']==12 || $this->request->get['ask_type_id']==13 || $this->request->get['ask_type_id']==8 ) { ?>
              <tr>
                <td><span class="required">*</span>年份<span class="help">如果此分類無需年份篩選則勿填寫</span></td>
                <td><input type="text" name="year"  value="<?php echo $year; ?>" /></td>
              </tr>
             <tr>
             <?php } ?>
              <td>類別</td>
              <td><select name="ask_type_id">
 				  <?php foreach ($ask_types as $ask_type) { ?>
                  <option value="<?php echo $ask_type['ask_type_id']; ?>" <?php if($ask_type_id==$ask_type['ask_type_id']) echo 'selected="selected"'; ?> ><?php echo $ask_type['title']; ?></option>
                    <?php } ?>
                </select></td>
            </tr>
            <tr class="hide">
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $ask_store)) { ?>
                    <input type="checkbox" name="ask_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="ask_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $ask_store)) { ?>
                    <input type="checkbox" name="ask_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="ask_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr class="hide">
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
            </tr>
             <tr class="hide">
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
            <tr class="hide">
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
        
            <!-- <tr>
            <td>檔案下載</td>
            <td><input id="download" type="text" readonly="" name="download" value="<?php echo $download; ?>" /> <a id="button-upload" class="button"><?php echo $button_upload; ?></a> &nbsp;<a   onclick="$('#download').val('')" id="button-clear" class="button"   <?php if(empty($download)) echo 'style="display:none"'; ?> >清除</a>
             </td>
            </tr> -->
       <?php $attribute_row = 0; ?>
      <?php if($download){?>
      <?php foreach ($download as $down){?>
        <tbody   id="attribute-row<?php echo $attribute_row; ?>" >
             <tr>
            <td>檔案下載<br></td>
      <td>名稱：<input type="text"  name="download[<?php echo $attribute_row; ?>][name]" value="<?php echo $down['name'] ?>" size="40"/> </td>
      <td>排序：<input type="text"  name="download[<?php echo $attribute_row; ?>][order]" value="<?php echo $down['order'] ?>" size="10"/> </td>
            <td><input type="text"  name="download[<?php echo $attribute_row; ?>][url]" value="<?php echo $down['url'] ?>" id="downloadx<?php echo $attribute_row; ?>"/> <a id="button-upload<?php echo $attribute_row; ?>" class="button"><?php echo $button_upload; ?></a>
             </td>

        <td class="left"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button">刪除</a></td>
          </tr>
        </tbody>
      <?php $attribute_row++; ?>
     <?php } ?>
      <?php } ?>
       <tfoot>
        <tbody>
              <tr>
                <td colspan="4"></td>
                <td class="left"><a onclick="addAttribute();" class="button">添加檔案</a></td>
              </tr>
         </tbody>
            </tfoot>
          </table>
        </div>
       </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
 CKEDITOR.replace('description<?php echo $language['language_id']; ?>');
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
attribute_row++;
  html  = '<tbody id="attribute-row' + attribute_row + '">';
    html += '  <tr >';
  html += '    <td >檔案下載</td>';
  html += '<td>名稱：<input type="text"  name="download[' + attribute_row + '][name]" value="" size="40"/> </td>';
  html += '<td>排序：<input type="text"  name="download[' + attribute_row + '][order]" value="" size="10"/> </td>';
  html += '    <td><input type="text" name="download[' + attribute_row + '][url]" value="" id="downloadx' + attribute_row + '" /> <a id="button-upload'+attribute_row+'" class="button"><?php echo $button_upload; ?></a></td>';

  html += '    <td class="left"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button">刪除</a></td>';
    html += '  </tr>';  
   html += '</tbody>';
  
  $('#attribute tfoot').before(html);
var v=attribute_row;
new AjaxUpload('#button-upload'+v+'', {

  action: 'index.php?route=catalog/product/upload&token=<?php echo $token; ?>',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function(file, extension) {
    $('#button-upload'+v+'').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-upload'+v+'').attr('disabled', true);
  },
  onComplete: function(file, json) {
    $('#button-upload'+v+'').attr('disabled', false);
    
    if (json['success']) {
      alert(json['success']);
      $('#downloadx'+v+'').attr('value', json['filename']);
    }
    if (json['error']) {
      alert(json['error']);
    }
    $('.loading').remove(); 
  }
});

  
  
}
</script> 
<script type="text/javascript"><!--
<?php for($v=0;$v <= $attribute_row;$v++){ ?>
new AjaxUpload('#button-upload<?php echo $v; ?>', {
  action: 'index.php?route=catalog/product/upload&token=<?php echo $token; ?>',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function(file, extension) {
    $('#button-upload<?php echo $v; ?>').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-upload<?php echo $v; ?>').attr('disabled', true);
  },
  onComplete: function(file, json) {
    $('#button-upload<?php echo $v; ?>').attr('disabled', false);
    if (json['success']) {
      alert(json['success']);
      
      $('#downloadx<?php echo $v; ?>').attr('value', json['filename']);
    }
    if (json['error']) {
      alert(json['error']);
    }
    $('.loading').remove(); 
  }
});

<?php } ?>
</script>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--></script> 


<?php echo $footer; ?>