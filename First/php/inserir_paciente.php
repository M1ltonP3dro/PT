<?php
include "conexao.php";
$paciente = json_decode(file_get_contents(("php://input")), true);

//Verificar se há algum valor nulo ou que não foi enviado
foreach ($paciente as $p) {
    if (empty($p)) {
        echo json_encode(["erro" => "Algum campo não foi preenchido corretamente."]);
        die();
    }
}
$inserir = $conexao->prepare("insert into pacientes (nome_completo,data_nascimento,email,telefone,senha,genero) values (?,?,?,?,?,?)");
$inserir->execute([$paciente["nome_completo"], $paciente["data_nascimento"], $paciente["email"], $paciente["telefone"],password_hash($paciente["senha"],PASSWORD_DEFAULT),$paciente["genero"]]);
echo json_encode(["sms"=>"paciente cadastrado"]);
?>