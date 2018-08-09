.row
  .col-sm-11
    h2 Comentarios
  .col-sm-1
    a.btn.btn-success.btn-sm href="/comentarios/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Nome
        th Email
        th Texto
        th Actions
    tbody
      - comentarios.each do |comentarios|
        tr
          td = comentarios.nome
          td = comentarios.email
          td = comentarios.texto
          td
            span
              == link_to("read", "/comentarios/#{comentarios.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/comentarios/#{comentarios.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/comentarios/#{ comentarios.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
