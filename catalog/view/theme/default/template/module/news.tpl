<div id="prod-message">
<ul>
<?php foreach($newses as $news){?>
<li><a href="<?php  echo $news['href'] ?>"><?php  echo $news['title'] ?></a></li>
<?php } ?>
 </ul>
</div>
<script type="text/javascript">
 
//跑馬燈
$(function(){
var $marqueeUl = $('div#prod-message ul'),
$marqueeli = $marqueeUl.append($marqueeUl.html()).children(),
_height = $('div#prod-message').height() * -1,
scrollSpeed = 600,
timer,
speed = 3000 + scrollSpeed;
$marqueeUl.css('top', $marqueeli.length / 2 * _height);
$marqueeli.hover(function(){
clearTimeout(timer);
}, function(){
timer = setTimeout(showad, speed);
});
function showad(){
var _now = $marqueeUl.position().top / _height;
_now = (_now - 1 + $marqueeli.length) % $marqueeli.length;
$marqueeUl.animate({
top: _now * _height
}, scrollSpeed, function(){
if(_now == 0){
$marqueeUl.css('top', $marqueeli.length / 2 * _height);
}
});
timer = setTimeout(showad, speed);
}
timer = setTimeout(showad, speed);
$('a').focus(function(){
this.blur();
});
});
</script>
