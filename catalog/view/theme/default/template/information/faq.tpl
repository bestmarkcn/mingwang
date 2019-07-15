<?php echo $header; ?> 
  
<div class="container sub-content" role="main">
<?php echo $column_right; ?>

<div class="fck-content">
<h2 class="headline"><?php echo $heading_title; ?></h2>
<div class="main">

<div class="fck clearfix">
<!--fck start-->
<style>
.fck p,.fck h1,.fck h2,.fck h3,.fck h4,.fck h5,.fck h6{ margin:0}
.faq div a{	padding:10px 20px 10px 60px;  line-height:20px; font-weight:bold; color:#86C0EA; font-size:15px; display:block;margin-bottom:20px; }
.faq div.unselected a:hover, 
.faq div a:hover, 
.faq div.selected a{	background:url(images/uploads/icon-Q-on.png) no-repeat;background-size:45px; color:#0390D5;border:none;}
.faq div.unselected a{ 	background:url(images/uploads/icon-Q.png) no-repeat;background-size:45px; color:#86C0EA;}
.faq ul{	list-style-type: none;	margin: 0;	padding: 0;}
.faq ul li{ border:none; background:url(images/uploads/icon-A.png) no-repeat;background-size:45px; padding-left:60px; margin-bottom:20px;}

</style>

<?php echo $description; ?>


<!--fck end-->
</div>

</div>

</div>




</div>  

<script type="text/javascript" src="js/ddaccordion.js"></script>
<script type="text/javascript">
//top
$(function(){
$("#goTop").click(function(){
$("html,body").animate({scrollTop:0},900);
return false;
});});
//浮動選單
$(function(){
var $cart = $('#inner'),
_top = $cart.offset().top;
var $win = $(window).scroll(function(){
if($win.scrollTop() >= _top){
if($cart.css('position')!='fixed'){
$cart.css({
position: 'fixed',
top: 0
});}
}else{
$cart.css({
position: 'absolute'
});}});});
//FAQ
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
})


</script>

<?php echo $footer; ?>