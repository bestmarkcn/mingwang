<?php echo $header; 

$width=1060;
$height=401;
?>

<div class="second-page">
<div class="container">
<ol class="breadcrumb">
     <?php foreach ($breadcrumbs as $key=>$breadcrumb) { ?>
    <li <?php if($key==0) echo 'class="home"'; ?>  > <span  class="space"><?php echo $breadcrumb['separator']; ?></span><a href="<?php echo $breadcrumb['href']; ?>" <?php if(($key+1)==count($breadcrumbs)) echo 'class="active"'; ?>  ><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>

</ol>
</div>
</div>
<div class="container sub-content" role="main">
<?php echo $column_right; ?>
<div class="design">
<h2 class="headline">線上合成圖</h2>
<div class="main well clearfix">

<div class="design-choose clearfix">

<div class="select-group left-area">
<div class="select-item">
<select class="form-control" name="category_id">
<?php  foreach($categories as $category){ ?>
<option  value="<?php echo $category['category_id'] ?>"  <?php  if($category['category_id']==$category_id) echo 'selected="selected"';  ?>><?php echo $category['name'] ?></option>
<?php } ?>
 </select>
</div>
<div class="select-item">
<select class="form-control" name="sub_category_id">
</select>
</div>
<div class="select-item">
<select class="form-control" name="product_id" onChange="$(window).unbind('beforeunload');location.href='index.php?route=product/design&product_id='+this.value">
</select>
</div>
</div>

<div class="choose-color right-area">
<div class="head clearfix">
顏色選擇
<span>設計師使用色系</span>
</div>
<ul class="clearfix list-unstyled">
<input type="hidden" id="product_image_id" name="product_image_id"    value=""   />

<?php foreach ($images as $image) { ?>
	<?php if($image['color_code']){ ?>
	<li lang="<?php echo $image['color_code'] ?>"><a onClick="change_image(this,'<?php echo $image['color_code'] ?>','<?php echo $image['product_image_id'] ?>')" href="javascript:void(0)"><div class="colorbox"><span class="inner" style="background:<?php echo $image['color_code'] ?>"></span></div></a></li>
	<?php  }else{ ?>
	<li  lang="<?php echo $image['color_image'] ?>" ><a onClick="change_image(this,'<?php echo $image['color_image'] ?>','<?php echo $image['product_image_id'] ?>')"  href="javascript:void(0)"><div class="colorbox"><img src="<?php echo $image['color_image'] ?>" class="inner"></div></a></li>
	<?php } ?>
<?php } ?>


 </ul>

</div>
</div>

<div class="prod-canvas"  >
    <canvas id="pcpb_canvas" width="100%" height="100%"  style="border: 1px solid #DDD"></canvas>

</div>


<?php  ?>
<div class="design-control clearfix">
<div class="pull-left">
<div class="fileUpload">
    <a class="glyphicon glyphicon-picture" id="uploadBtn"  >插入圖檔</a>

</div>
<input  type="text" id="uploadFile"  readonly="" class="file-input" name="design_image" />

<a href="javascript:void(0);" class="btn-save" onclick="finish()" style="border-right: none;">保存設計</a>
<a href="javascript:void(0);" class="btn-save" onclick="pcpb.deleteActiveObject();">刪除選中圖層</a>

</div>
<div id="spinner" class="modalBackground" style="display: none;"></div>

<a class="btn-cart pull-right" href="javascript:void(0)" onclick="add_to_cart()" id="button-cart"><i class="icon"></i>加入詢價車</a>

<div class="clearfix"></div>
<div id="upload_image">
</div>

</div>


</div>

</div>

</div>


<script type="text/javascript"><!--
$('select[name=\'category_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=product/design/category&category_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'category_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
 			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['sub_categories'] != '') {
				for (i = 0; i < json['sub_categories'].length; i++) {
        			html += '<option value="' + json['sub_categories'][i]['category_id'] + '"';
	    			
					if (json['sub_categories'][i]['category_id'] == '<?php echo $sub_category_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['sub_categories'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'sub_category_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'sub_category_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=product/design/product&category_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'sub_category_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
 			
			html = '<option value=""><?php echo $text_select; ?></option>';
 			if (json['products'] != '') {
				for (i = 0; i < json['products'].length; i++) {
        			html += '<option value="' + json['products'][i]['product_id'] + '"';
	    			
					if (json['products'][i]['product_id'] == '<?php echo $product_id; ?>') {
	      				html += ' selected="selected"';
	    			}
 	    			html += '>' + json['products'][i]['name_en']+json['products'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'product_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});



$('select[name=\'category_id\']').trigger('change');
//$('select[name=\'sub_category_id\']').trigger('change');

$.ajax({
		url: 'index.php?route=product/design/product&category_id=<?php echo $sub_category_id ?>',
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'sub_category_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
 			
			html = '<option value=""><?php echo $text_select; ?></option>';
 			if (json['products'] != '') {
				for (i = 0; i < json['products'].length; i++) {
        			html += '<option value="' + json['products'][i]['product_id'] + '"';
	    			
					if (json['products'][i]['product_id'] == '<?php echo $product_id; ?>') {
	      				html += ' selected="selected"';
	    			}
 	    			html += '>' + json['products'][i]['name_en']+json['products'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'product_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	
 	
   function add_to_cart() {
     if($('#product_image_id').val()==''){
 	  alert('請先選擇顏色');
	  return;
	}
    if($('#uploadFile').val()==''){
 	  alert('請保存設計圖');
	  return;
	}
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.main input[type=\'text\'], .main input[type=\'hidden\'], .main input[type=\'radio\']:checked, .main input[type=\'checkbox\']:checked, .main select, .main textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
			    if($('#cart-total').html()=='0'){
				  $('#cart-list').html(json['item']);
				}else{
				  $('#cart-list').append(json['item']);
				}	
				$('.success').fadeIn('slow');
					
				$('#cart-total-text').html(json['success']);
				$('#cart-total').html(json['total']);
				$(window).unbind('beforeunload');
				location.href='index.php?route=checkout/cart';
				//$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
} 
 
	
	
//--></script> 
 	<script type="text/javascript" src="js/pcpb/fabric.js?v=2.3"></script>
  	<script type="text/javascript" src="js/pcpb/PCPB.js?v=2.3"></script>

<script>

		var currentScale = getScale();
		var viewportWidth = window.innerWidth * currentScale;
		var viewportHeight = window.innerHeight * currentScale;
		
		var minWidth = 910;
		var bgWidth = <?php echo $width; ?>;
		var leftToolbarWidth = 0;
		var bgHeight = <?php echo $height; ?>;
		var bottomToolbarHeight = 10;
		var ratio = 1;
		
		var ratioW = 1;
		var ratioH = 1;
		
		//calculate canvas size
		//resize popup
		var canvasWidth = viewportWidth - leftToolbarWidth;

		var canvasHeight = viewportHeight - bottomToolbarHeight;
		
		if(canvasWidth < bgWidth)			
		{
			ratioW = bgWidth / canvasWidth;
		}
		
		if(canvasHeight < bgHeight)
		{
			ratioH = bgHeight / canvasHeight;
		}
		
		if(ratioW > ratioH)
			ratio = ratioW;
			
		if(ratioH > ratioW)
			ratio = ratioH;
		
		canvasWidth = bgWidth / ratio;
		canvasHeight = bgHeight / ratio
		
		var width = viewportWidth - leftToolbarWidth;
		if(width > minWidth)
			width = minWidth;
		var height = bgHeight + bottomToolbarHeight;
		var changeBGInit = false;
		var changeImageInit = false;
 		function setOptionImageId(id){
			$('#image_option_id').val(id);
		}
		function btnBackAndClose(){
			if(!confirm('<?php echo $text_All_text_image_cleared; ?>'))
				return;
			parent.closePopupPCPB(0);
		}
		function btnBack(){
			if(!confirm('<?php echo $text_All_text_image_cleared; ?>'))
				return;
			location.href='index.php?route=pcpb/create&product_id=<?php echo $product_id ?>'
		}
		function btnChangeBackground(){
			$('#pcpb_edit_text,#pcpb_edit_image,#pcpb_edit_background').hide();
			$('#pcpb_edit_background').show();
			if(changeBGInit == false){
				changeBGInit = true;
				$('#pcpb_background_upload').ajaxUploadPrompt({
					type: 'POST',
					url: 'index.php?route=pcpb/upload',
					dataType: 'json',
					success: function(datas){
						if(typeof(datas) == 'string')
						{
							//fix for IE problem
							eval('datas = ' + datas);
						}
						if(datas.errorCode != 0)
							alert(datas.errorMessage);
						else{
							var imagePath = datas.imagePath;
							setBackground(imagePath);
						}
					}
				});
			}
		}
		function changeImage(){
			$.colorbox({
				overlayClose: false,
				opacity: 0.5,
				iframe: true,
				href: 'index.php?route=pcpb/create/selectImage&product_id=<?php echo $product_id ?>',
				width: '90%',
				height: '100%',
				open: true
			});
		}
		function setBackground(imagePath){
			if(typeof(imagePath) != 'undefined' && imagePath != '')
				pcpb.setBackgroundImage(imagePath);
		}
		function setOriginBackground(){
			if(typeof(originBG) != 'undefined' && originBG != '')
				pcpb.setBackgroundImage(originBG);
		}
		function closePopupPCPB(){
			$.colorbox.close();
		}

		function finish(){
			if(!confirm('保存后將不能繼續移動設計圖稿，確定保存當前設計圖？'))
				return;
				
		   // pcpb.setBackgroundImage('images/none.gif',canvasWidth,canvasHeight);
          //  pcpb._canvas.backgroundColor = '';

			var canvasData = pcpb.saveToImage();
			//split data to pieces with 90kb/piece
			var pieceCount = parseInt(canvasData.length/90000+1);
			var link = '<?php echo $link; ?>';
	     	pcpb._canvas.overlayImage='';
			var pieceIndex = 0;
			$('#spinner').show();
			sendData(pieceIndex, pieceCount, canvasData);
		}
		function sendData(index, count, data){
			var dataSend = data.substring(index*90000, (index+1)*90000);
			$.ajax({
				type: 'POST',
				url: 'index.php?route=product/design/finish',
				dataType: 'json',
				data: {imageData: dataSend, imageIndex: index+1, imageCount: count},
				success: function(datas){
					console.log(datas);
					if(datas.errorCode != 0)
						alert(datas.errorMessage);
					else{
						index++;
						if(index<count)
							sendData(index,count,data);
						else{
							var token = datas.token;
						    $('input[name=\'design_image\']').attr('value', datas.content);
 	     	                  
/*							 design_color=$('li.active').attr('lang');
 							  if(design_color.substr(0, 1)=='#'){
								pcpb.setBackgroundImage('images/none.gif',1300,410);
								pcpb._canvas.backgroundColor = design_color;
							 }else{
								 pcpb.setBackgroundImage(design_color,1300,410);
							 }
 							 pcpb._canvas.renderAll();
*/
							//location.href='index.php?route=pcpb/create/finish&token=' + token + '&product_id=<?php echo $product_id ?>&product_option_price=<?php echo $product_option_price;?>&product_option_value_id=<?php echo $product_option_value_id; ?>&image_option_id=' + $('#image_option_id').val();						
						}
					}
				}
			})
		}
		function getScale()
		{
			var viewportScale = 1; 
			// Get viewport width
			var viewportWidth = document.documentElement.clientWidth; 
			// Abort. Screen width is greater than the viewport width (not fullscreen).
			if(screen.width > viewportWidth) { console.log('Aborted viewport scale measurement. Screen width > viewport width'); return 1; }
			// Get the orientation corrected screen width 
			var orientation = updateOrientation(); 
			var screenWidth = screen.width; 			
			if(orientation === 'portrait') { 
				// Take smaller of the two dimensions 
				if(screen.width > screen.height) 
					screenWidth = screen.height; 
			} 
			else { 
				// Take larger of the two dimensions 
				if(screen.width < screen.height) 
					screenWidth = screen.height; 
			} 
			// Calculate viewport scale 
			viewportScale = screenWidth / window.innerWidth; 
			
			if(viewportScale > 1)
				viewportScale = 1;
			
			return viewportScale;
		}
		
		function updateOrientation()
		{
			var orientation = window.orientation; 
			if(orientation === undefined) { 
				// No JavaScript orientation support. Work it out. 
				if(document.documentElement.clientWidth > document.documentElement.clientHeight) 
					orientation = 'landscape'; 
				else 
					orientation = 'portrait'; 
			} 
			
			else if(orientation === 0 || orientation === 180) 
				orientation = 'portrait'; else orientation = 'landscape'; 
			// Assumed default, most laptop and PC screens. 
			
			return orientation;
		};

		//init for canvas manager
		    var pcpb = new PCPB('pcpb_canvas',false);
 			var originBG = '<?php echo $design; ?>';
  			pcpb.setWidth(canvasWidth);
			pcpb.setHeight(canvasHeight);
			pcpb.setScale(ratio);
			pcpb.setOverlayMode(false);
		  	pcpb.setBackgroundImage(originBG,canvasWidth,canvasHeight);
	        pcpb.addImage(originBG,canvasWidth,canvasHeight,'bg');
      	   // pcpb.addImage('images/uploads/img68.png');
    

</script>
<script>

function change_image(obj,imageurl,product_image_id){
   $('#product_image_id').val(product_image_id);
   $('.clearfix li').removeClass('active');
   $(obj).parent().addClass('active');
   //$('#big_image').attr('src',imageurl);
   // pcpb._canvas.dispose();
    //  pcpb.setBackgroundImage(imageurl);
    //  pcpb.changeImage(imageurl,'bg',canvasWidth,canvasHeight);
      if(imageurl.substr(0, 1)=='#'){
	    pcpb.setBackgroundImage('images/none.gif',canvasWidth,canvasHeight);
        pcpb._canvas.backgroundColor = imageurl;
 	 }else{
         pcpb.setBackgroundImage(imageurl,canvasWidth,canvasHeight);
	 }
     pcpb._canvas.renderAll();
}
</script>


<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script> 
<script type="text/javascript"> 
new AjaxUpload('#uploadBtn', {
	action: 'index.php?route=product/design/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#uploadBtn').after('<img src="images/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#uploadBtn').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#uploadBtn').attr('disabled', false);
		
		if (json['success']) {
 			
			// $('#upload_image').append('<input type="text" name="upload_file[]" value="'+json['filename']+'" id="'+json['token']+'"  />');
			// $('input[name=\'design_image\']').attr('value', json['content']);
			
			 pcpb.addImage('download/temp/'+json['filename']);
 		}
 		if (json['error']) {
			alert(json['error']);
		}
 		$('.loading').remove();	
	}
});

   $(window).bind('beforeunload',function(){return '你的信息尚未加入詢價車，離開頁面后設計信息將丟失。';});

</script>


<?php echo $footer; ?>