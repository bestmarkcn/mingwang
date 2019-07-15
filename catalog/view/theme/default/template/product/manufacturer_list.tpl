<?php echo $header; ?> 
  
  
  
<div class="second-page">
<div class="container">
<ol class="breadcrumb">
<li class="home"><a href="index.php">首頁</a><span  class="space">\</span></li>
<li class="active">合作客戶</li>
</ol>
</div>
</div> 
<div class="container sub-content" role="main">
<?php echo $column_right; ?>

<div class="clients">
<h2 class="headline">合作客戶</h2>
<div class="main clients-list well clearfix">
<?php foreach($manufacturers as $manufacturer){ ?>
<div class="col-xs-3 item"><a href="<?php echo $manufacturer['href'] ?>"><img src="<?php echo $manufacturer['logo'] ?>"><p><?php echo $manufacturer['name'] ?></p></a></div>
<?php } ?>
 </div>

</div>

</div>
  
  
<?php echo $footer; ?>