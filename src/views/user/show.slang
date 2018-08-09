h1 Show User
p = user.email
p = user.encrypted_password
p
  == link_to("back", "/users", class: "btn btn-light btn-sm")
  == link_to("edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/users/#{user.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
