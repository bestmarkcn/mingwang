<?php echo $header; ?> 
  
 <div class="second-page">
<div class="container">
<ol class="breadcrumb">
<li class="home"><a href="index.php">首頁</a><span  class="space">\</span></li>
<li><a href="index.php?route=information/information&information_id=1">印製技術</a><span  class="space">\</span></li>
<li class="active"><?php echo $heading_title; ?></li>
</ol>
</div>
</div>
  
  
<div class="container sub-content" role="main">
<?php echo $column_right; ?>
<div class="left-side">
<ul class="list-group submenu">
<li class="list-group-item title">印製技術<span>PRINT</span></li>
<li class="list-group-item <?php if($_GET['information_id']==5){ echo 'active';} ?> "><a  href="index.php?route=information/information/printinfo&information_id=5">各種技術說明</a></li>
<li class="list-group-item <?php if($_GET['information_id']==6){ echo 'active';} ?>"><a  href="index.php?route=information/information/printinfo&information_id=6">專業的好態度</a></li>
</ul>
<a href="maito:080@myif.net"><img src="images/left-side-call.png"></a>
</div>

<div class="right-content fck-content">
<h2 class="headline"><?php echo $heading_title; ?></h2>
<div class="main">

<div class="fck clearfix">
<!--fck start-->
<style>
.fck p,.fck h1,.fck h2,.fck h3,.fck h4,.fck h5,.fck h6{ margin:0}
.print-top{background: url(images/uploads/right-content.png)#fff no-repeat top center; background-size:100%; padding:20px; border:1px solid #CCC; margin-bottom:20px;}
.print-top .left-area, .print-top .right-area{ width:340px;}
.print-top .row{ margin:0 -10px;}
.print-top .col-xs-4{ padding:0 10px; text-align:center;}
.print-explain{border-bottom:1px dotted #CECECE; padding:20px;}
.print-explain .left-area{ padding-bottom: 20px; width:270px;}
.print-explain .right-area{ width:460px;}
.print-explain .row{  margin:0 -10px;}
.print-explain .col-xs-4{ padding:0 10px; text-align:center;}
td{ vertical-align:top;}
@media (max-width: 1059px){
.print-top .row{ margin:0;}
.print-top .col-xs-4{ padding:0 ;}
}
</style>
<?php echo $description; ?>

<!--fck end-->
</div>

</div>

</div>




</div>
  
  
<?php echo $footer; ?>