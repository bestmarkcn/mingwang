$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};

function AjaxChange(table,field,wherefield,id,oldval,obj,token){
           newval=$(obj).val();
 	   	   $.get('index.php?route=common/update&token='+token+'&table='+table+'&field='+field+'&wherefield='+wherefield+'&oldval='+oldval+'&newval='+newval+'&id='+id);
 
}