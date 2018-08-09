.row
  .col-sm-11
    h2 Users
  .col-sm-1
    a.btn.btn-success.btn-sm href="/users/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Email
        th Encrypted_password
        th Actions
    tbody
      - users.each do |user|
        tr
          td = user.email
          td = user.encrypted_password
          td
            span
              == link_to("read", "/users/#{user.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/users/#{user.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/users/#{ user.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
