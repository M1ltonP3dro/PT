<?php
    include "conexao.php";
    $consulta_data=json_decode(file_get_contents("php://input"),true);

    foreach($consulta_data as $cd){
        if(empty($cd)){
            echo json_encode(["erro"=>"informacoes em falta"]);
            die();
        }
    }

    $consulta=$conexao->prepare("insert into consultas (paciente_id,medico_id,data_hora_consulta,motivo,estado) values (?,?,?,?,?)");
    $consulta->execute([$consulta_data["paciente_id"],$consulta_data["medico_id"],
    $consulta_data["data_hora_consulta"],$consulta_data["motivo"],$consulta_data["estado"]]);
    echo json_encode(["sms"=>"consulta marcada"]);
?>