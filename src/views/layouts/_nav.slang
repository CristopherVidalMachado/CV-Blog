- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home


- active = context.request.path == "/comentarios" ? "active" : ""
a class="nav-item #{active}" href="/comentarios" Comentarios
- active = context.request.path == "/users" ? "active" : ""
a class="nav-item #{active}" href="/users" Users
