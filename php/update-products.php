<?php

@include 'config.php';

if(isset($_POST['submit'])){

  
   $sku = mysqli_real_escape_string($conn, $_POST['sku']);
   $price = mysqli_real_escape_string($conn, $_POST['price']);
   $discount = mysqli_real_escape_string($conn, $_POST['discount']);
   $quantity = mysqli_real_escape_string($conn, $_POST['quantity']);
  
  
   $update = "UPDATE `product` SET ,`sku`='$sku',`price`='$price',`discount`='$discount',`quantity`='$quantity' , where `sku`='$sku'";
         
         mysqli_query($conn, $update);
         header('location:admin.php');
   };


?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Admin Page</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<div class="form-container">

   <form action="" method="post">
      <h3>Update products</h3>
      
      
      <div>
      <label for="sku">SKU</label>
      <input type="text" name="sku" >
      </div>
      <div>
      <label for="price">Price</label>
      <input type="number" name="price" >
      </div>
     <div>
     <label for="discount">Discount</label>
      <input type="number" name="discount" >
     </div>
      
     <div>
     <label for="quantity">Quantity</label>
      <input type="number" name="quantity" >
     </div>
     
     
      
      
      <input type="submit" name="submit" value="Add Product" class="form-btn">
      
   </form>

</div>

</body>
</html>