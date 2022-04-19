<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update, Delete & Reserve Products</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="logger/structure.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link href="css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css"/>
	<link rel="icon" type="image/png" href="media/images/library.png">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="js/myjquery.js"></script>
</head>
<body>
<?php
    include "config.php";
    $prod_id=$_GET['id'];
    $q = "SELECT * from product where id='$id'";
    $result=mysqli_query($conn, $q);
    while($rs=mysqli_fetch_array($result)){
		$id = $row['id']; 
		$userId = $row['userId'];
		$title = $row['title'];
		$type =$row['type'];
		$sku = $row['sku'];
		$price = $row['price'];
		$discount =$row['discount'];
		$quantity = $row['quantity'];
    }
    $category="SELECT * from category;";
    $result=mysqli_query($conn, $category);
?>
<center><div id="header"><h1 class="header-text">Update, Delete & Reserve Products</h1><div id=menu-modal>
	<a href="index.php"><button id="b1" class="btn btn-primary ">&nbspHome</button></a>
	<a href="viewreserved.php"><button id="b2" class="btn btn-primary ">&nbspView Reserved Products</button></a>
</div></div></center>
</div></div></center>
<div id="container">
<div class="form_head" align="center">Update Products</div><br>
	<form method="post" action="process.php">
		<label class="control-label">Product ID :</label>
<div class="controls">
	<input type="text" name="ebookid" placeholder="Product ID" id="ebookid" value="<?php echo $id;?>"/>
</div>
		<label class="control-label">Product Name :</label>
<div class="controls">
	<input type="text" name="ebookname" placeholder="Product Name" id="ebookname" value="<?php echo $title;?>"/>
</div>
		<label class="control-label">Category :</label>
<div class="controls">
<select name="ecategory" id="ecategory">
	<option><?php echo $type; ?></option>
<?php
	while($rs=mysqli_fetch_array($result)){
	$categ=$rs['category'];
	echo "<option>".$categ."</option>";
	}
?>
</select>
</div>
		<label class="control-label">Quantity :</label>
<div class="controls">
	<input type="text" name="equantity" placeholder="Number of Products to add" id="equantity" value="<?php echo $quantity; ?>"/>
</div>
<div class="controls">
		<button id="btn" class="btn btn-primary">Update</button>
		<a href="index.php" id="btnc" class="btn btn-info">Cancel</a>
</div>
	</form>
</div>
</body>
</html>