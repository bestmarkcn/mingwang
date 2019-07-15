<?php echo $header; ?> 
  
 <div class="main-focus02">
 <div class="banner">
<img src="images/n-banner.jpg">
      </div>
</div>
<div class="location">
     <?php foreach ($breadcrumbs as $key=>$breadcrumb) { ?>
	  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>" <?php if(($key+1)==count($breadcrumbs)) echo 'class="cur"'; ?> ><?php echo $breadcrumb['text']; ?></a>
     <?php } ?>
</div>
  
 <div class="content">
  <?php echo $text_message; ?>
   <div class="cl"></div>
</div>
  
  
 
  
  
   
  
<?php echo $footer; ?>


 