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
.left-area, .right-area{ width:500px;}

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
 

</script>

<?php echo $footer; ?>