

	<div class="language fr"><span><?php echo $text_select_language ?></span>
		<ul class="list">
			 <?php foreach ($languages as $key=>$language) { ?>
			<li><a <?php  if($language['code']==$this->session->data['language']){  echo  'class="cur"'; } ?> href="<?php echo $action; ?>&language_code=<?php echo $language['code']; ?>&redirect=<?php echo urlencode($redirect); ?>"> <?php echo $language['name']; ?> </a></li>
			 <?php } ?>
		</ul>
	</div>


