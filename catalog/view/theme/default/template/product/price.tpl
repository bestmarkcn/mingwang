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

<div class="right-content price">
<h2 class="headline"><?php echo $heading_title; ?></h2>
<div class="main">
<div class="clearfix well">

<?php foreach($products as $product){ ?>


<div class="item">
<h5 class="sub-title"><a name="<?php echo $product['product_id'] ?>" style="color:#FFFFFF"  ><?php echo $product['name_en'].$product['name'] ;?></a></h5>

<table class="table table-bordered">
<thead>
<?php  $prices_title=array_shift($product['prices']);  ?>
<tr>
<td width="10%"><?php echo $prices_title['name'] ?></td>
<td width="10%" <?php if(empty($prices_title['field1'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field1'] ?></td>
<td width="10%" <?php if(empty($prices_title['field2'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field2'] ?></td>
<td width="10%" <?php if(empty($prices_title['field3'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field3'] ?></td>
<td width="10%" <?php if(empty($prices_title['field4'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field4'] ?></td>
<td width="10%" <?php if(empty($prices_title['field5'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field5'] ?></td>
<td width="10%" <?php if(empty($prices_title['field6'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field6'] ?></td>
<td width="10%" <?php if(empty($prices_title['field7'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field7'] ?></td>
<td width="10%" <?php if(empty($prices_title['field8'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field8'] ?></td>
<td width="10%" <?php if(empty($prices_title['field9'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field9'] ?></td>
<td width="10%" <?php if(empty($prices_title['field10'] )) echo 'style="display:none"'; ?>><?php echo $prices_title['field10'] ?></td>

</tr>
</thead>
<tbody>
<tr>
<th><?php echo $product['min_qty'] ;?></th>
<td colspan="10"><?php echo $product['min_qty_text'] ;?></td>
</tr>
 <?php 
  $prices=$product['prices'];
  foreach($prices as $price){
   ?>

<tr>
<th><?php echo $price['name'] ?></th>
<td <?php if(empty($prices_title['field1'] )) echo 'style="display:none"'; ?>><?php echo $price['field1'] ?>元</td>
<td <?php if(empty($prices_title['field2'] )) echo 'style="display:none"'; ?>><?php echo $price['field2'] ?>元</td>
<td <?php if(empty($prices_title['field3'] )) echo 'style="display:none"'; ?>><?php echo $price['field3'] ?>元</td>
<td <?php if(empty($prices_title['field4'] )) echo 'style="display:none"'; ?>><?php echo $price['field4'] ?>元</td>
<td <?php if(empty($prices_title['field5'] )) echo 'style="display:none"'; ?>><?php echo $price['field5'] ?>元</td>
<td <?php if(empty($prices_title['field6'] )) echo 'style="display:none"'; ?>><?php echo $price['field6'] ?>元</td>
<td <?php if(empty($prices_title['field7'] )) echo 'style="display:none"'; ?>><?php echo $price['field7'] ?>元</td>
<td <?php if(empty($prices_title['field8'] )) echo 'style="display:none"'; ?>><?php echo $price['field8'] ?>元</td>
<td <?php if(empty($prices_title['field9'] )) echo 'style="display:none"'; ?>><?php echo $price['field9'] ?>元</td>
<td <?php if(empty($prices_title['field10'] )) echo 'style="display:none"'; ?>><?php echo $price['field10'] ?>元</td>
</tr>
<?php } ?>
 <tr>
<th><?php echo $product['max_qty'] ;?></th>
<td colspan="10"><?php echo $product['max_qty_text'] ;?>
</td>
</tr>
 

</tbody>
</table>
</div>
<?php } ?>
<div class="item">
 

<div class="fck clearfix">
<!--fck start-->
<style>
.fck p,.fck h1,.fck h2,.fck h3,.fck h4,.fck h5,.fck h6{ margin:0}
</style>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="font-size:13px; font-family:Arial, 'Microsoft JhengHei', Helvetica, sans-serif; line-height:20px;">
<tr>
<td>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td style=" background:#F29200; color:#fff; width:130px; text-align:center; font-weight:bold; font-size:17px; vertical-align:middle;">超優惠專案</td>
<td style="padding:5px 10px;"> <?php  echo $meta_special; ?></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><hr style="border:none; height:1px; background:#ccc; margin:20px 0;"></td>
</tr>
<tr>
<td>
 <?php  echo $meta_keyword; ?>
</td>
</tr>
</table>
<!--fck end-->
</div>
</div>
</div>

</div>


</div>




</div>


 

<?php echo $footer; ?>