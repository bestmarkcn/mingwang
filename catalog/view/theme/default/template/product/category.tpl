<?php echo $header; ?>
 
<div class="page-header" style="background-image:url(images/banner/info-product.png)">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-6 col-sm-6 hidden-xs">
          			<ol class="breadcrumb">
            			<li><a href="index.php">首頁</a></li>
            			<li class="active">產品介紹</li>
          			</ol>
            	</div>
            	<div class="col-md-6 col-sm-6 col-xs-12">
    				<h2>產品介紹</h2>
                </div>
           	</div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="double-border"></div>
    <!-- Secondary Header -->
    <div class="secondary-bar-new">
		<div class="container">
			<h3 class="title"><i class="fa fa-archive"></i> 產品介紹</h3>
        </div>
	</div>
    <!-- Start Body Content -->
  	<div class="main" role="main">
    	<div id="content" class="content full">
    		<div class="container">
            	<ul class="grid-holder col-3 projects-grid sort-destination magnific-gallery" data-sort-id="projects">
                <?php foreach($products as $products_v) {?>
                    <li class="grid-item format-standard oceans ">
                        <div class="grid-item-inner">
                        	<a href="<?php echo $products_v['image'] ?>" class="media-box"
							rel="<h3><?php echo $products_v['name'] ?></h3>
                                <p><?php echo $products_v['meta_description'] ?></p>                       
                                <p><?php echo $products_v['description'] ?></p>"
							>
							<img src="<?php echo $products_v['thumb'] ?>" alt="">
							</a>
                            <div class="grid-content">
                                <p><?php if(!empty($products_v['name'])) {?><b><?php echo $products_v['name'] ?></b><br><?php } ?>       
                                <?php if(!empty($products_v['meta_description'])) {?><?php echo $products_v['meta_description'] ?><?php } ?> 
								<?php if(!empty($products_v['description'])) {?><?php echo $products_v['description'] ?><?php } ?> </p>
                            </div>
                    	</div>
                  	</li>
                <?php } ?>
                </ul>
            </div>
       	</div>
   	</div> 
<?php echo $footer; ?>


<script>
    $('.magnific-gallery').magnificPopup({
        delegate: 'a', // child items selector, by clicking on it popup will open
        type: 'image',
        gallery:{enabled:true}
        // other options
    });
</script> 
