<?php echo $header; ?>
 
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
		<div class="prod-list">
			<ul>
			    <?php foreach ($products as $product) { ?>

 				<li> <a href="<?php echo $product['href']; ?>" class="prod-item"> <img src="<?php echo $product['thumb']; ?>"/>
					<div class="mask"></div>
					<span class="prodlist-title"><?php echo $product['name']; ?></span></a> </li>
			   <?php } ?>
 			</ul>
			<div class="cl"></div>
		</div>
		<div class="manu"> <?php echo $pagination; ?></div>
	</div>
	<div class="cl"></div>
</div>







 
 
 

<?php echo $footer; ?>