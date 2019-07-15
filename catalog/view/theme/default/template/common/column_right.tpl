 
<div id="sidebar">
<div id="inner">
<a href="index.php?route=checkout/cart" class="cart"><span class="icon"></span>詢價車</a>
<a href="#" class="line"><span class="icon"></span>LINE</a>
<a href="#" class="skype"><span class="icon"></span>SKYPE</a>
<a href="javascript:void(0)" onclick=" goTop()" id="goTop" class="btn-top">go top</a>
</div>
</div>

<script type="text/javascript">
//top
 
 function goTop(){
$("html,body").animate({scrollTop:0},900);
return false;
} 
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
