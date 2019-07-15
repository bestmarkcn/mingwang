
<script src="js/collapse/jquery.collapse.js"></script>
<script src="js/collapse/jquery.collapse_storage.js"></script>
<script src="js/collapse/jquery.collapse_cookie_storage.js"></script>


<script>
   $("#nav-catalogue").collapse({
		accordion: true,
		persist: true,
		open: function() {
			this.addClass("open");
			this.css({ height: this.children().outerHeight() });
		},
		close: function() {
			this.css({ height: "0px" });
			this.removeClass("open");
		}
	});
</script>
	<div class="leftmain fl">
		<div id="nav-catalogue" data-collapse="accordion persist">
			
			 <?php foreach ($categories as $key=>$category) { ?>

			<h2><?php echo $category['name']; ?></h2>
			<div class="sub-menu">
				<ul>
				<?php if ($category['children']) { ?>
                 <?php foreach ($category['children'] as $child) { ?>
				 
				   <?php if ($child['category_id'] == $child_id) { ?>
                     <li  ><a href="<?php echo $child['href']; ?>" class="cur"> - <?php echo $child['name']; ?></a></li>
				   <?php } else { ?>
                     <li  > <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a></li>
                    <?php } ?>
				 <?php } ?>
               <?php } ?>

 				</ul>
			</div>
			<?php } ?>
 		</div>
	
	</div>



