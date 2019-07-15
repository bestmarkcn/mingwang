<?php echo $header; ?>
<style>
i.open, i.close {
  background: url("../image/glyphicons-halflings.gif") repeat scroll -408px -96px rgba(0, 0, 0, 0);
  cursor: pointer;
  display: inline-block;
  height: 14px;
  width: 14px;
}

i.close {
    background-position: -433px -96px;
}
</style>
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
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $repair; ?>" class="button"><?php echo $button_repair; ?></a><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($categories) { ?>
	   <?php foreach ($categories as $category) {

              $style = $category['pid'] != 0 ? 'style="display:none"' : '';
              $index = ' index='.$category['id'].' pid='.$category['pid'];

			  ?>
            <tr  <?php echo $style.$index ?>>
              <td style="text-align: center;"><?php if ($category['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" />
                <?php } ?></td>
              <td class="left"><i class="open onc" ></i><?php echo $category['name']; ?></td>
              <td class="right"> 
			  
			     <input onchange="AjaxChange('category','sort_order','category_id','<?php echo $category['category_id']; ?>','<?php echo $category['sort_order']; ?>',this,'<?PHP   echo $token;?>')" name="sort_order[]" value="<?php echo $category['sort_order']; ?>" size="4" />

			  </td>
              <td class="right"><?php foreach ($category['action'] as $action) { ?>
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
<script language="JavaScript" type="text/JavaScript">
$(".list").on("click",".open",function(){
  var pid = $(this).parents("tr").attr('index');
  $(this).removeClass('open').addClass('close');
  $('tr[pid="'+pid+'"]').fadeIn();
});

$(".list").on("click",".close",function(){
  var pid = $(this).parents("tr").attr('index');
  colseChildren(pid);
})

$("tr[index]").each(function(){

  var index = $(this).attr('index');
  var len = $('tr[pid="'+index+'"]').length;
  if(len == 0) $(this).find(".onc").css({"background":"none","cursor":"default"});
})

function colseChildren(pid)
{
$('tr[pid="'+pid+'"]').fadeOut("fast");
$('tr[index="'+pid+'"] .close').removeClass('close').addClass('open');
$('tr[pid="'+pid+'"]').each(function(){
  var index = $(this).attr("index");
  colseChildren(index);
});
}
function updatex(obj)
{

  var value = obj.value;
  var name = $(obj).attr("name");
  var id = $(obj).attr("id");
  var table = $(obj).attr("table");
 
  $.ajax({
    url : 'index.php?route=ajax/ajax/update&token=<?php  echo $this->session->data['token']; ?>',
    type : "post",
    data : 'id='+id+'&name='+name+'&value='+value+'&table='+table,
    dataType : 'json',
    success : function(data)
    {
    // location.reload();
    }
  })
}
</script>
<?php echo $footer; ?>