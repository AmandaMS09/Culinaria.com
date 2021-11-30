<?php
$servername = 'localhost';
$database = 'dbculinaria';
$password = '';


//criando a conexão
$conn = mysqli_connect($servername, $password, $database);


//verificando se conectou
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}
echo "Conexão";
?>