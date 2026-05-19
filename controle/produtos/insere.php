<?php
require './controle/conexao.php';
$pdo = Conexao::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
/*proid, 
pronome, 
prodescricao, 
provalorcusto, 
provalorvenda, 
proquantidade, 
prosubid, 
proativo*/
$sqlpro = "";