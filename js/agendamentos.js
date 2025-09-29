async function carregarAgendamentos() {
    ans = await fetch("php/notificacoes_admin.php")
    ans = await ans.json()
    carregarTabela(ans)
    return ans
}
carregarAgendamentos()

function carregarTabela(vet) {
    tbody.innerText = ""
    vet.forEach((v, i) => {
        tr = document.createElement("tr")
        tr.innerHTML = `
            <td>${v.data_hora_consulta}</td>
            <td>${v.paciente}</td>
            <td>${v.medico}</td>
            <td>${v.especialidade}</td>
            <td>${v.motivo_consulta}</td>
            <td><span class="status pending">${v.estado}</span></td>
            <td class="actions">
                <button class="action-btn complete" title="Marcar como concluído" value="Concluído"><i class="fas fa-check"></i></button>
                <button class="action-btn pending" title="Marcar como pendente" value="Agendado"><i class="fas fa-clock"></i></button>
                <button class="action-btn cancel" title="Cancelar" value="Cancelado"><i class="fas fa-times"></i></button>
            </td>
        `
        tbody.appendChild(tr)
    })
}

async function mudarEstado(){
    res=await carregarAgendamentos()
    estado=null
    btn=[...document.getElementsByClassName("action-btn")]
    btn.forEach((b,i)=>{
        b.addEventListener("click",()=>{
            estado=b.value
            console.log(estado)
        })
    })
}
mudarEstado()