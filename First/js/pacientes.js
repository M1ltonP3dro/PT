async function carregarPacientes(){
    ans=await fetch("php/listar_pacientes.php")
    ans=await ans.json()
    console.log(ans)
    listarPacientes(ans)
}
carregarPacientes()

function listarPacientes(vet){
    tbody.innerText=""
    vet.forEach((v,i)=>{
        tr=document.createElement("tr")
        tr.innerHTML=`
            <td>${v.nome_completo}</td>
                <td>${v.data_nascimento}</td>
                <td>${v.genero}</td>
                <td>${v.telefone}</td>
                <td class="actions">
                  <button class="action-btn view" title="Ver detalhes"><i class="fas fa-eye"></i></button>
                  <button class="action-btn edit" title="Editar"><i class="fas fa-edit"></i></button>
                  <button class="action-btn delete" title="Eliminar"><i class="fas fa-trash"></i></button>
                </td>
              </tr>
        `
        tbody.appendChild(tr)
    })
}