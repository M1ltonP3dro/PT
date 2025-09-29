<?php
    $conexao=new PDO("mysql:host=localhost;dbname=db_sdc","root","");
    if(!$conexao){
        echo json_encode(["erro"=>"Ocorreu um erro de conexão"]);
        die();
    }
?>