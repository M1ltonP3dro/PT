async function carregarMedicos(){
    ans=await fetch("php/listar_medicos.php")
    ans=await ans.json()
    console.log(ans)
    escreverMedicos(ans )
}
carregarMedicos()
function escreverMedicos(vet){
    tbody.innerText=""
    vet.forEach((v,i)=>{
        tr=document.createElement("tr")
        tr.innerHTML=`
            <td>${v.nome_completo}</td>
                <td>${v.especialidade}</td>
                <td><span class="status-badge active-status">Ativo</span></td>
                <td class="actions">
                  <button class="action-btn edit" title="Editar"><i class="fas fa-edit"></i></button>
                  <button class="action-btn schedule" title="Horários"><i class="fas fa-calendar-alt"></i></button>
                  <button class="action-btn delete" title="Eliminar"><i class="fas fa-trash"></i></button>
                </td>
        `
        tbody.appendChild(tr)
    })
}

async function inserirMedico(){
    event.preventDefault()
    obj={
        nome_completo:document.getElementById("prof-name").value,
        especialidade:document.getElementById("prof-specialty").value,
        email:document.getElementById("prof-email").value,
        telefone:document.getElementById("prof-phone").value,
        data_nascimento:document.getElementById("prof-birth").value,
        genero:document.getElementById("prof-gender").value
    }
    ans=await fetch("php/inserir_medico.php",{
        method:"post",
        body:JSON.stringify(obj)
    })
    ans=await ans.json()
    if(ans.erro){
        return
    }
    alert(ans.sms)
}