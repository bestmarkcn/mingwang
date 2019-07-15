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

<div class="left-side">

<?php echo $column_left; ?>
</div>

<div class="right-content size">
<h2 class="headline"><?php echo $heading_title; ?></h2>
<div class="main">
<div class="clearfix well size-top">
<img src="<?php echo $thumb ?>" class="left-area">
<div class="right-area">
<div class="fck clearfix">
<!--fck start-->
<p style="font-size:13px; line-height:150%; color:#444; font-family:Arial, 'Microsoft JhengHei', Helvetica, sans-serif; margin:0">
 

<?php echo $description; ?>
</p>
<!--fck end-->
</div>
<?php if(!empty($file_ai) ||  !empty($file_jpg)){ ?>
 <div class="downloan-btn clearfix">
<h3 class="title"><span>作圖專用檔案下載</span></h3>
<?php if($file_ai){ ?>
<a href="<?php  echo HTTP_DOWNLOAD.$file_ai ?>" target="_blank"><span class="glyphicon glyphicon-save"></span> AI 下載</a>
<?php } ?>
<?php if($file_jpg){ ?>
<a href="<?php  echo HTTP_DOWNLOAD.$file_jpg ?>" target="_blank"><span class="glyphicon glyphicon-save"></span> JPG 下載</a>
<?php } ?>
 </div>
<?php } ?>

</div>

</div>

<div class="well size-btm">
<h4 class="title"><?php echo $heading_title; ?></h4>
<?php foreach($products as $product){ ?>
<div class="item">
<h5 class="sub-title"><?php echo $product['name_en'].$product['name'] ;?></h5>
<table class="table table-bordered">
 
<tbody>
 <?php 
  $attributes=$product['attributes'];
  foreach($attributes as $attribute){
   ?>

<tr>
<th style="color:#999; font-size:11px;"><?php echo $attribute['name'] ?></th>
<td  <?php if(empty($attributes[0]['field1'])) echo 'style="display:none"'; ?>><?php echo $attribute['field1'] ?></td>
<td  <?php if(empty($attributes[0]['field2'])) echo 'style="display:none"'; ?>><?php echo $attribute['field2'] ?></td>
<td <?php if(empty($attributes[0]['field3'])) echo 'style="display:none"'; ?>><?php echo $attribute['field3'] ?></td>
<td <?php if(empty($attributes[0]['field4'])) echo 'style="display:none"'; ?>><?php echo $attribute['field4'] ?></td>
<td <?php if(empty($attributes[0]['field5'])) echo 'style="display:none"'; ?>><?php echo $attribute['field5'] ?></td>
<td <?php if(empty($attributes[0]['field6'])) echo 'style="display:none"'; ?>><?php echo $attribute['field6'] ?></td>
<td <?php if(empty($attributes[0]['field7'])) echo 'style="display:none"'; ?>><?php echo $attribute['field7'] ?></td>
<td <?php if(empty($attributes[0]['field8'])) echo 'style="display:none"'; ?>><?php echo $attribute['field8'] ?></td>
<td <?php if(empty($attributes[0]['field9'])) echo 'style="display:none"'; ?>><?php echo $attribute['field9'] ?></td>
<td <?php if(empty($attributes[0]['field10'])) echo 'style="display:none"'; ?>><?php echo $attribute['field10'] ?></td>
<td <?php if(empty($attributes[0]['field11'])) echo 'style="display:none"'; ?>><?php echo $attribute['field11'] ?></td>
<td <?php if(empty($attributes[0]['field12'])) echo 'style="display:none"'; ?>><?php echo $attribute['field12'] ?></td>
<td <?php if(empty($attributes[0]['field13'])) echo 'style="display:none"'; ?>><?php echo $attribute['field13'] ?></td>
<td <?php if(empty($attributes[0]['field14'])) echo 'style="display:none"'; ?>><?php echo $attribute['field14'] ?></td>
<td <?php if(empty($attributes[0]['field15'])) echo 'style="display:none"'; ?>><?php echo $attribute['field15'] ?></td>
<td <?php if(empty($attributes[0]['field16'])) echo 'style="display:none"'; ?>><?php echo $attribute['field16'] ?></td>
<td <?php if(empty($attributes[0]['field17'])) echo 'style="display:none"'; ?>><?php echo $attribute['field17'] ?></td>
<td <?php if(empty($attributes[0]['field18'])) echo 'style="display:none"'; ?>><?php echo $attribute['field18'] ?></td>
</tr>
<?php } ?>
 

</tbody>
</table>
</div>
<?php } ?>
 
<div class="fck clearfix">
<!--fck start-->
<p style="font-size:13px; line-height:150%; color:#444; font-family:Arial, 'Microsoft JhengHei', Helvetica, sans-serif; margin:0">
  <?PHP  echo $meta_description; ?>
</p>
<!--fck end-->
</div>

</div>

</div>


</div>




</div>


 

<?php echo $footer; ?>