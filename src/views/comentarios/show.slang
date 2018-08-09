h1 Show Comentarios
p = comentarios.nome
p = comentarios.email
p = comentarios.texto
p
  == link_to("back", "/comentarios", class: "btn btn-light btn-sm")
  == link_to("edit", "/comentarios/#{comentarios.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/comentarios/#{comentarios.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
