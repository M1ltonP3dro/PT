<?php
    include "conexao.php";
    //usa para criar options dinamicamente
    $espec=$conexao->prepare("select nome from especialidades");
    $espec->execute();
    $espec=$espec->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($espec);
?>