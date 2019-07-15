



<div class="topcart">
<div class="qty" id="cart-total"><?php echo count($products); ?></div>
詢價車

<div class="dropdown">
<button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<span id="cart-total-text"><?php echo count($products); ?>件商品待詢價</span>
<span class="caret"></span>
</button>
<div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
<div class="cart-list">
 <?php if ($products  ) { ?>

<ul class="list-unstyled" id="cart-list">
<?php foreach ($products as $product) { ?>
 <li><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?>(<?php echo $product['color_name']; ?>)</a><span>x<?php echo $product['quantity']; ?></span></li>
 <?php } ?>
 </ul>
<a href="index.php?route=checkout/cart" class="btn">前往詢價</a>
<?php } else { ?>
<ul class="list-unstyled" id="cart-list">
  <li><p class="">您尚未添加商品在估價車。</p></li>
</ul>

<a href="index.php?route=checkout/cart" class="btn">前往詢價</a>
<?php } ?>
</div>
 

</div>
</div>
</div>