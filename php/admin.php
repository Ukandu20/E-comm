<?php

@include 'config.php';

session_start();


?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>admin page</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="logger/structure.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/table.css" />
    <link href="css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="media/css/demo_table.css" />
    <link rel="stylesheet" type="text/css" href="media/themes/smoothness/jquery-ui-1.8.4.custom.css" />


   
 
</head>
<body>
   
<div class="container">

   <div class="content">
      <h3>hi, <span>admin</span></h3>
      <h1>welcome <span><?php echo $_SESSION['admin_name'] ?></span></h1>
      <p>this is an admin page</p>

      <center><div id="header"><h1 class="header-text">Update, Delete & ADD Products</h1><div id=menu-modal>
	<a href="../index.html"><button id="b1" class="btn btn-primary ">&nbspHome</button></a>
	<a href="viewreserved.php"><button id="b2" class="btn btn-primary ">&nbspView Reserved Products</button></a>
</div></div></center>
<div id="container2">
	<div class="form_head" align="center">List Of Products</div><br>
		<div class="control-group">
		    <table name="booklist" id="dtable" width="900">
			<thead>
				<th>Product ID</th>
                <th>USER ID</th>
				<th>Product Name</th>
				<th>Product Category</th>
                <th>Product SKU</th>
                <th>Product PRICE</th>
				<th>Product DISCOUNT</th>
				<th>Product QUANTITY</th>
			</thead>
<tbody>

<?php
@include 'config.php';

$select = " SELECT * FROM product; ";

   $result = mysqli_query($conn, $select);

   while($row = mysqli_fetch_assoc($result)){

   $id = $row['id']; 
   $userId = $row['userId'];
   $title = $row['title'];
   $type =$row['type'];
   $sku = $row['sku'];
   $price = $row['price'];
   $discount =$row['discount'];
   $quantity = $row['quantity'];
  
    echo "<tr class='tb1'>";
	echo "<td>".$id."</td>";
	echo "<td>".$userId."</td>";
	echo "<td>".$title."</td>";
	echo "<td>".$type."</td>";
    echo "<td>".$sku."</td>";
    echo "<td>".$price."</td>";
    echo "<td>".$discount."</td>";
    echo "<td>".$quantity."</td>";
	echo "<td> <a href='edit.php?id=$id' id='popedit'>Update</a>  | <a href='delete.php?id=$id' id='popedit'>Delete</a>    </td>";
	echo "</tr>";

      }

?>
<tbody>
			</table>
		</div>
</div>
      <div class="sidebar">
  <a class="active" href="#home">Monitor</a>
  <a href="add-products.php">Products</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
</div>

      <a href="login_form.php" class="btn">login</a>
      <a href="register_form.php" class="btn">register</a>
      <a href="logout.php" class="btn">logout</a>
   </div>

</div>

</body>
</html>