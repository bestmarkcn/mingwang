<?php echo $header; ?>
 

<div class="page-header" style="background-image:url(images/banner/info-news.png)">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-6 col-sm-6 hidden-xs">
          			<ol class="breadcrumb">
            			<li><a href="index.php">首頁</a></li>
            			<li class="active">新聞專區</li>
          			</ol>
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-12">
    				<h2><?php echo $title ?></h2>
                </div>
           	</div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="double-border"></div>
    <!-- Secondary Header -->
    <div class="secondary-bar-new">
		<div class="container">
			<h3 class="title"><i class="fa fa-calendar"></i> <?php echo $title ?></h3>
        </div>
	</div>
    <!-- Start Body Content -->
  	<div class="main" role="main">
    	<div id="content" class="content full">
    		<div class="container">
        		<div class="row">
            		<div class="col-md-12">
						<div class="media-heading">
							<div class="pull-right">
							<?php if(!empty($news['download'])) {?>
								<a href="index.php?route=investor/directors/download&download=<?php echo $news['download'] ?>" class="btn btn-primary btn-lg">檔案下載</a>
							<?php } ?>
							</div>
							<h2><?php echo $news['title'] ?></h2>
							<span class="post-time meta-data"><?php echo substr($news['date_added'],0,10) ?></span>
						</div>
						
                    	<div class="entry">
                       		<?php echo $news['description'] ?>
							<div class="spaced"></div>
							<div class="center-block text-align-center">
								<a href="<?php echo $back ?>" class="btn btn-default btn-lg"><i class="fa fa-backward"></i> 返回上頁</a>
							</div>
                       	</div>
                   	</div>
                    
              	</div>
            </div>
       	</div>
   	</div>


 
<?php echo $footer; ?>
 	                

