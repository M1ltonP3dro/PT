e=null
async function carregarNotificacoes() {
    ans = await fetch("php/notificacoes_admin.php")
    ans = await ans.json()
    console.log(ans)
    carregarDadosNotificacoes(ans)
}
carregarNotificacoes()

function carregarDadosNotificacoes(vet) {
    not_container = document.querySelector(".notifications-container")
    not_container.innerText=""
    vet.forEach((v, i) => {
        div_not=document.createElement("div")
        div_not.classList.add("notification-item")
        div_not.classList.add("unread")
        div_not.innerHTML=`
            <div class="notification-icon appointment">
              <i class="fas fa-calendar-check"></i>
            </div>
            <div class="notification-content">
              <div class="notification-header">
                <h4>Nova consulta agendada</h4>
                <span class="notification-time">${v.data_hora_consulta}</span>
              </div>
              <p>${v.paciente} agendou uma consulta com ${v.medico} para ${v.data_hora_consulta}.</p>
              <div class="notification-actions">
                <button class="action-btn view" title="Ver detalhes"><i class="fas fa-eye"></i> Ver detalhes</button>
                <button class="action-btn mark-read" title="Marcar como lida"><i class="fas fa-check"></i></button>
              </div>
            </div>
        `
        not_container.appendChild(div_not)
    })
}