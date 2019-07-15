<?php echo $header; ?>

<script type="text/javascript">  
	//Tabs  
	$(function() {  
		var $title = $("#tabs .tab-title li");  
		var $content = $("#tabs .panes");  
		$title.click(function() {  
			var index = $title.index($(this));  
			$(this).addClass("active").siblings().removeClass("active");  
			$content.hide();  
			$($content.get(index)).show();  
			return false;  
		});  
	});  
</script>
<div class="main-focus02">
	<div class="banner"> <img src="images/n-banner.jpg"> </div>
</div>
<div class="location">
     <?php foreach ($breadcrumbs as $key=>$breadcrumb) { ?>
	  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>" <?php if(($key+1)==count($breadcrumbs)) echo 'class="cur"'; ?> ><?php echo $breadcrumb['text']; ?></a>
     <?php } ?>
</div>

<div class="content">
<?php echo $column_left; ?>

	<div class="nycenter fr">
		<div class="prod-pc-txt">
			<div class="prod-pc fl"><img src="<?php echo $thumb; ?>"/></div>
			<div class="prod-txt fr">
				<div class="prodshow-title"><?php echo $heading_title; ?></div>
				<div class="prodshow-bz"><span>Mechanical Seals</span>水用</div>
				<div class="prodicogn">
 <!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5296e3011b8f1400" async="async"></script>
					<ul>
						<li class="prodprint"><a href="javascript:window.print()"><img src="images/print.jpg" class="fl"/>print</a></li>
						<li class="prodhline">|</li>
						<li>share:</li>
						<li><!-- Go to www.addthis.com/dashboard to customize your tools -->
						<div class="addthis_sharing_toolbox"></div></li>
											</ul>
				</div>
				<div class="prodshow-font"><?php echo $meta_description; ?></div>
				<div class="prod-bt">
					<ul>
					    <?PHP if($download){ ?>
						<li class="prod-bt01"><a target="_blank" href="<?php echo HTTP_DOWNLOAD.$download ?>">DOWNLOAD</a></li>
						<?PHP } ?>
						<li class="prod-bt02"><a href="index.php?route=information/contact">INQUIRY</a></li>
					</ul>
				</div>
			</div>
			<div class="cl"></div>
		</div>
		<div class="prod-show">
			<div id="tabs">
				<div class="tab-title">
					<ul>
						<li class="active"><a href="#"><?php echo $text_product_size ?></a></li>
						<li><a href="#"><?php echo $text_product_struct ?></a></li>
					</ul>
				</div>
				<div class="panes"><?php echo $description; ?> </div>
				<div class="panes" style="display: none;"> <?php echo $tag; ?> </div>
			</div>
		</div>
	</div>
	<div class="cl"></div>
</div>


 
<?php echo $footer; ?>