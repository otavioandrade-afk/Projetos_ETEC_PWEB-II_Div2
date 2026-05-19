<?php
/*
mesma coisa que o uses do Delphi ou Lazarus (ALT+F11)
*/
require './controle/conexao.php';
/*
FDQuery do Delphi ou ZQuery do Lazarus
Conectamos a Query
*/
$pdo = Conexao::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sqlpro = 
"
select 
    proid,
    pronome,
    prodescricao,
    provalorcusto,
    provalorvenda,
    proquantidade,
    prosubid,
    subnome,
    subcatid,
    catnome,
    fotcaminho,
    proativo
from
    produtos,
    subcategorias,
    categorias,
    fotosproduto
where
    prosubid = subid
and
    subcatid = catid
and 
    fotproid = proid
and
    fotprincipal = 1
";
$prppro = $pdo->prepare($sqlpro);
$prppro->execute();
/*while($dspro = $prppro->fetch(PDO::FETCH_ASSOC)){
  echo $dspro['pronome'].'<br>';
}*/
?>
<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>O Lojinha</title>
  <link
    rel="stylesheet"
    href="node_modules/bootstrap/dist/css/bootstrap.min.css" />
</head>

<body>
  <header>
    <?php require('menu.php');//unit uses unit?>
  </header>
  <main class="container">
    <div id="carouselExampleIndicators" class="carousel slide">
      <div class="carousel-indicators">
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0"
          class="active"
          aria-current="true"
          aria-label="Slide 1"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1"
          aria-label="Slide 2"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2"
          aria-label="Slide 3"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="3"
          aria-label="Slide 4"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="4"
          aria-label="Slide 5"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="5"
          aria-label="Slide 6"></button>
        <button
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="6"
          aria-label="Slide 7"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="carousel/c1.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c2.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c3.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c4.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c5.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c6.webp" class="d-block w-100" alt="..." />
        </div>
        <div class="carousel-item">
          <img src="carousel/c7.webp" class="d-block w-100" alt="..." />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleIndicators"
        data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <div class="row">
      <?php while($dspro = $prppro->fetch(PDO::FETCH_ASSOC)){ ?>
      <div class="col mt-2">
        <div class="card" style="width: 18rem;">
          <img src="<?php echo $dspro['fotcaminho'];?>" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"><?php echo mb_strimwidth($dspro['pronome'],0,60,"..."); ?></h5>
            <p class="card-text"><?php echo mb_strimwidth($dspro['prodescricao'],0,130,"..."); ?></p>
            <p class="text-danger">Valor:<b>R$ <?php echo $dspro['provalorvenda']; ?></b></p>
            <p class="text-primary">Estoque: <?php echo $dspro['proquantidade']; ?></p>
            <a href="#" class="btn btn-primary">Ver Produto</a>
          </div>
        </div>
      </div>
      <?php }?>
    </div>
  </main>

  <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>