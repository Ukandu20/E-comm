<!-- (A) PRODUCTS -->
<div id="products"><?php
  // (A1) GET ALL PRODUCTS
  require "config.php";
  $products = $DB->fetchAll("SELECT * FROM `product`");
 
  // (A2) PRODUCTS LIST
  foreach ($products as $p) { ?>
  <div class="pCell">
    <div class="pTxt">
      <div class="Name"><?=$p["title"]?></div>
      <div class="price">$<?=$p["price"]?></div>
    </div>
    <img class="pImg" src="images/<?=$p["image"]?>"/>
    <button class="pAdd" onclick="cart.add(<?=$p["id"]?>)">
      Add To Cart
    </button>
  </div>
  <?php } ?>
</div>
 
<!-- (B) CURRENT CART -->
<div id="cart"></div>