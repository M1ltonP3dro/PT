<?php
    include "conexao.php";
    $pacientes=$conexao->prepare("select * from pacientes");
    $pacientes->execute();
    $pacientes=$pacientes->fetchAll(PDO::FETCH_ASSOC);
    if(!$pacientes){
        echo json_encode(["erro"=>"algo deu errado"]);
        die();
    }
    echo json_encode($pacientes);
?>