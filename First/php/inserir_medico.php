<?php
include "conexao.php";
$medico=json_decode(file_get_contents(("php://input")), true);

//Verificar se há algum valor nulo ou que não foi enviado
foreach ($medico as $m) {
    if (empty($m)) {
        echo json_encode(["erro" => "Algum campo não foi preenchido corretamente."]);
        die();
    }
}

$get_espec = $conexao->prepare("select id from especialidades where nome=?");
$get_espec->execute([$medico["especialidade"]]);
$get_espec = $get_espec->fetch(PDO::FETCH_ASSOC);
echo json_encode($get_espec);

$inserir = $conexao->prepare("insert into medicos (nome_completo,data_nascimento,email,telefone,especialidade_id,genero) values (?,?,?,?,?,?)");
$inserir->execute([$medico["nome_completo"], $medico["data_nascimento"], $medico["email"], $medico["telefone"], $get_espec["id"],$medico["genero"]]);
echo json_encode(["sms" => "medico cadastrado"]);
?>