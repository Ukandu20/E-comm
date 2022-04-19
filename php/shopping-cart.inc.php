<?php

@include 'config.php';

if(isset($_POST['submit'])){

   $userId = mysqli_real_escape_string($conn, $_POST['userId']);
   $title = mysqli_real_escape_string($conn, $_POST['title']);
   $slug = mysqli_real_escape_string($conn, $_POST['slug']);
   $type = mysqli_real_escape_string($conn, $_POST['type']);
   $sku = mysqli_real_escape_string($conn, $_POST['sku']);
   $price = mysqli_real_escape_string($conn, $_POST['price']);
   $discount = mysqli_real_escape_string($conn, $_POST['discount']);
   $quantity = mysqli_real_escape_string($conn, $_POST['quantity']);
  
  
   $select = " SELECT * FROM product WHERE userId = '$userId' ";

   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){

      $error[] = 'user does not have access to this page!';

   }else{
         $insert = "INSERT INTO `product`( `userId`, `title`, `slug`, `type`, `sku`, `price`, `discount`, `quantity`) VALUES ('$userId','$title','$slug','$type','$sku','$price','$discount','$quantity')";
         
         mysqli_query($conn, $insert);
         header('location:login_form.php');
      }
   };


?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register form</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<div class="form-container">

   <form action="" method="post">
      <h3>Add products</h3>
      <div>
      <label for="UserId">UserId</label>
      <input type="number" name="userId"  >
      </div>
      
      <div>
      <label for="title">title</label>
      <input type="text" name="title" >
      </div>

      <div>
      <label for="slug">slug</label>
      <input type="url" name="slug" >
      </div>
      
      <div>
          <label for="type">type</label>
      <input type="text" name="type" >
      </div>
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