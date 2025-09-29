<?php
    include "conexao.php";
    header("content-type:application/json");
    $usuario=json_decode(file_get_contents("php://input"),true);
    //a var de baixo verifica se o paciente foi encontrado no banco de dados ou nao ($achou)
    $achou=false;

    $get_users=$conexao->prepare("select * from pacientes");
    $get_users->execute();
    $get_users=$get_users->fetchAll(PDO::FETCH_ASSOC);

    foreach($get_users as $users){
        if($usuario["email"]==$users["email"] && $usuario["senha"]==password_verify($usuario["senha"],$users["senha"])){
            $usuario_enc=$users;
            $achou=true;
        }
    }
    
    if(!$achou){
        echo json_encode(["erro"=>"usuario nao encontrado"]);
        die();
    }

    echo json_encode(["sms"=>"usuario encontrado","usuario"=>$usuario_enc,"confirmar_login"=>$achou]);
?>