 

<div class="submenu">
<h3 class="title">商品導覽<span>PRODUCTS</span></h3>
<div class="arrowsidemenu">
 <?php foreach ($categories as $key=>$category) { ?>

          <?php if ($category['category_id'] == $category_id) { ?>
        
		  <div  class="menuheaders  "><a style="background-image:url(<?php echo $category['icon']; ?>)" href="javascript:void(0)" class="active"><?php echo $category['name']; ?></a></div>

        <?php } else { ?>
		  <div  class="menuheaders "><a style="background-image:url(<?php echo $category['icon']; ?>)" href="javascript:void(0)" class="active"><?php echo $category['name']; ?></a></div>
        <?php } ?>
		 <ul class="menucontents">
         <?php if ($category['children']) { ?>
          <?php foreach ($category['children'] as $child) { ?>
            <?php if ($child['category_id'] == $child_id) { ?>
            <li class="active">
            <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
             </li>
		    <?php } else { ?>
            <li  > <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a></li>
            <?php } ?>
          
          <?php } ?>
        <?php } ?>
         </ul>

  <?php } ?>
 
</div>
</div>

<a href="maito:080@myif.net"><img src="images/left-side-call.png"></a>

<script type="text/javascript" src="js/ddaccordion.js"></script>

<script type="text/javascript">
//左側選單
ddaccordion.init({
headerclass: "menuheaders", //Shared CSS class name of headers group
contentclass: "menucontents", //Shared CSS class name of contents group
revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", or "mouseover"
mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content.
onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
animatedefault: false, //Should contents open by default be animated into view?
persiststate: true, //persist state of opened contents within browser session?
toggleclass: ["unselected", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
togglehtml: ["none", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
animatespeed: 500, //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
oninit:function(expandedindices){ //custom code to run when headers have initalized
},
onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
}
});

</script>