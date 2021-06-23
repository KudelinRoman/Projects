<? php>
    $name=filter_var(trim($_POST['name']), FILTER_SANITIZE_STRING); 
    $famile=filter_var(trim($_POST['famile']), FILTER_SANITIZE_STRING); 
    $description=filter_var(trim($_POST['description']), FILTER_SANITIZE_STRING); 
    $date=filter_var(trim($_POST['date']), FILTER_SANITIZE_STRING);
    $id=$_COOKIE['user'];
    require_once("connect.php");
    $result=$mysql->query("UPDATE `user` SET name= '$name', last_name= '$famile',description='$description' , dateOfBirth='$date' WHERE id=$id");
    $mysql->close();
    header('Location: /');
?>