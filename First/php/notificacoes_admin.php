<?php
    include "conexao.php";

    $notify=$conexao->prepare("select consultas.id as id_consulta,pacientes.nome_completo as paciente,
    medicos.nome_completo as medico, especialidades.nome as especialidade, consultas.motivo as motivo_consulta,
    consultas.data_hora_consulta,consultas.estado as estado from consultas 
    join pacientes on paciente_id=pacientes.id
    join medicos on medico_id=medicos.id 
    join especialidades on especialidades.id=especialidade_id");

    $notify->execute();
    $notify=$notify->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($notify);
?>