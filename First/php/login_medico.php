<?php
    include "conexao.php";
    header("content-type:application/json");
    $medico=json_decode(file_get_contents("php://input"),true);
    //a var de baixo verifica se o medico foi encontrado no banco de dados ou nao ($achou)
    $achou=false;

    $get_users=$conexao->prepare("select * from medicos");
    $get_users->execute();
    $get_users=$get_users->fetchAll(PDO::FETCH_ASSOC);

    foreach($get_users as $users){
        if($medico["email"]==$users["email"] && $medico["senha"]==password_verify($medico["senha"],$users["senha"])){
            $medico_enc=$users;
            $achou=true;
        }
    }
    
    if(!$achou){
        echo json_encode(["erro"=>"medico nao encontrado"]);
        die();
    }

    echo json_encode(["sms"=>"medico encontrado","medico"=>$medico_enc,"confirmar_login"=>$achou]);
?>