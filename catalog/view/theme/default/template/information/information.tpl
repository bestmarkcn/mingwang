<?php echo $header; ?> 
  
<div class="page-header" style="background-image:url(images/banner/info-about-01.png);">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-6 col-sm-6 hidden-xs">
          			<ol class="breadcrumb">
            			<li><a href="index.php">首頁</a></li>
            			<li class="active"><?php echo $heading_title ?></li>
          			</ol>
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-12">
    				<h2><?php echo $heading_title ?></h2>
                </div>
           	</div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="double-border"></div>
    <!-- Secondary Header -->
    <div class="secondary-bar-new">
		<div class="container">
			<ul class="nav nav-pills pull-right">
				<li><a href="index.php?route=information/information&amp;information_id=1">關於我們</a></li>
				<li><a href="index.php?route=information/information&amp;information_id=2">公司簡介</a></li>
				<li><a href="index.php?route=information/information&amp;information_id=3">公司沿革</a></li>
				<li><a href="index.php?route=information/information&amp;information_id=4">集團架構</a></li>
			</ul>
			<h3 class="title"><i class="fa fa-building-o"></i> <?php echo $heading_title ?></h3>
        </div>
	</div>
  <?php echo $description; ?>


  
  
 
  
  
   
  
<?php echo $footer; ?>