- if comentarios.errors
  ul.errors
    - comentarios.errors.each do |error|
      li = error.to_s

== form(action: "/comentarios/#{comentarios.id.to_s}", method: comentarios.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "nome", value: comentarios.nome, placeholder: "Nome", class: "form-control")
  .form-group
    == text_field(name: "email", value: comentarios.email, placeholder: "Email", class: "form-control")
  .form-group
    == text_area(name: "texto", content: comentarios.texto, placeholder: "Texto", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/comentarios", class: "btn btn-light btn-sm")
