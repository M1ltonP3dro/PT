<?php
    include "conexao.php";
    //envia o estado da consulta e o id da consulta (id_consulta)
    $consulta=json_decode(file_get_contents("php://input"),true);
    foreach($consulta as $c){
        if(empty($c)){
            echo json_encode(["erro"=>"algo deu errado"]);
            die();
        }
    }
    $mudar_estado=$conexao->prepare("update consultas set estado=? where consultas.id=?");
    $mudar_estado->execute([$cconsulta["estado"],$consulta["id_consulta"]]);
?>