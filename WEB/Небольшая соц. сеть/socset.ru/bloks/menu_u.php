<?
  require_once 'user.php';
?>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/menu.css">
</head>
<body>

<div class="topnav">
    <div class="search-container">
      <form class="poisk" action="user.php" method = "get">
        <input class="inp-menu" type="text" placeholder="Search.." name="search">
        <input  type="hidden" name="id" value = "<?= $author_id?>">
        <button type="submit" ><i class="fa fa-search"></i></button>
      </form>
    </div>
  <a href="exit.php">Выход</a>
  <a href="index.php">Главная</a>
  <a href="dialogs.php">Диалоги</a>
</div>

</body>
</html>