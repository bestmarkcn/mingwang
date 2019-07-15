<?php echo $header; ?> 
 

<div class="second-page">
<div class="container">
<ol class="breadcrumb">
 

<li class="home"><a href="index.php">首頁</a><span  class="space">\</span></li>
<li><a href="index.php?route=product/manufacturer">合作客戶</a><span  class="space">\</span></li>
<li class="active"><?php echo $heading_title; ?></li>
</ol>
</div>
</div>
<div class="container sub-content" role="main">
<?php echo $column_right; ?>
<div class="clients">
<h2 class="headline">合作客戶</h2>
<div class="main clearfix client-detail well">
<div class="pull-left client-logo">
<img src="<?php echo $logo; ?>">
</div>

<div class="pull-right client-content">
<h3 class="title"><?php echo $heading_title; ?></h3>
<div class="client-pc"><img src="<?php echo $image; ?>"></div>
<div class="fck clearfix">
<!--fck start-->
<style>
.fck p,.fck h1,.fck h2,.fck h3,.fck h4,.fck h5,.fck h6{ margin:0}
</style>
 <?php  echo $description; ?>
</div>


</div>

</div>
</div>

</div>

<?php echo $footer; ?>