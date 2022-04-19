<!DOCTYPE html>
<html>
<head>
<title>Update, Delete & Reserve Products</title>
</head>
<style type="text/css">
body{
	background:#3B5998;
	}
</style>
<body>
<?php
	include 'config.php';
	function edit_product($userId,$id,$title,$type,$quantity){
	$q="UPDATE product set id='$id', prod_name='$title',prod_ctry='$type',prod_qty='$quantity' where prod_id='$id'";
	if(mysqli_query($q)){
	echo "<script language='javascript'>
		alert('PRODUCT UPDATED SUCCESSFULLY');
		window.location = 'index.php';
		</script>";
}
	else{
	echo "<script language='javascript'>
		alert('Error While Updating Products');
		window.location = 'edit.php';
		</script>";	
		}
}
	function delete_product($id){
	$q="DELETE from product where id='$id'";
	if(mysqli_query($q)){
	echo "<script language='javascript'>
		alert('PRODUCT DELETED SUCCESSFULLY');
		window.location = 'admin.php';
		</script>";
}
	else{
	echo "<script language='javascript'>
		alert('Error While Deleting Products');
		window.location = 'admin.php';
		</script>";	
		}
}
	function fetch_quantity($prodid,$no_copies){
	$q = "SELECT * from PRODUCT where id='$id'";
	$result=mysqli_query($q);
	while($rs=mysqli_fetch_array($result)){
	$quantity=$rs['quantity'];
	$ubk_qty=$quantity - $no_copies;
	if($ubk_qty<0){
	echo "<script language='javascript'>
		alert('PRODUCT IS OUT OF STOCK');
		window.location = 'admin.php';
		</script>";	
}
	else{
	$q="UPDATE product set quantity='$ubk_qty' where id='$id'";
	mysqli_query($q);
		}
	}
}
	

	function fetch_quantity_return($id,$no_copies){
	$q = "SELECT * from product where id='$id'";
	$result=mysqli_query($q);
	while($rs=mysqli_fetch_array($result)){
	$quantity=$rs['quantity'];
	$ubk_qty=$qtty + $no_copies;
	$q="UPDATE product set quantity='$ubk_qty' where id='$id'";
	mysql_query($q);
		}
}
function fetch_quantity_return_reserve($prodid,$no_copies){
	$q = "SELECT * from product where id='$id'";
	$result=mysqli_query($q);
	while($rs=mysqli_fetch_array($result)){
	$quantity=$rs['quantity'];
	$ubk_qty=$quantity + $no_copies;
	$q="UPDATE product set quantity='$ubk_qty' where id='$id'";		
		}
}


	if(isset($_GET['did'])){
	$id=$_GET['did'];
	delete_product($id);
}
	if(isset($_POST['eprodid'],$_POST['eprodname'],$_POST['ecategory'],$_POST['equantity'])){
	$id=$_POST['eprodid'];
	$title=$_POST['eprodname'];
	$type=$_POST['ecategory'];
	$quantity=$_POST['equantity'];
	edit_product('',$id,$title,$type,$quantity);
}
?>
</body>
</html>