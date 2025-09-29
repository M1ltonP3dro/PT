<?php
    include "conexao.php";
    header("content-type:application/json");
    //Na hora de filtrar usa JS
    $listar=$conexao->prepare("select medicos.*, especialidades.nome as especialidade from medicos join especialidades on especialidade_id=especialidades.id");
    $listar->execute();
    $medicos=$listar->fetchAll(PDO::FETCH_ASSOC);
    if(!$medicos){
        echo json_encode(["erro"=>"Deu ruim."]);
        die();
    }
    echo json_encode($medicos);
?>