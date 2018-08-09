class ComentariosController < ApplicationController
  def index
    comentarios = Comentarios.all
    render("index.slang")
  end

  def show
    if comentarios = Comentarios.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Comentarios with ID #{params["id"]} Not Found"
      redirect_to "/comentarios"
    end
  end

  def new
    comentarios = Comentarios.new
    render("new.slang")
  end

  def create
    comentarios = Comentarios.new(comentarios_params.validate!)

    if comentarios.valid? && comentarios.save
      flash["success"] = "Created Comentarios successfully."
      redirect_to "/comentarios"
    else
      flash["danger"] = "Could not create Comentarios!"
      render("new.slang")
    end
  end

  def edit
    if comentarios = Comentarios.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Comentarios with ID #{params["id"]} Not Found"
      redirect_to "/comentarios"
    end
  end

  def update
    if comentarios = Comentarios.find(params["id"])
      comentarios.set_attributes(comentarios_params.validate!)
      if comentarios.valid? && comentarios.save
        flash["success"] = "Updated Comentarios successfully."
        redirect_to "/comentarios"
      else
        flash["danger"] = "Could not update Comentarios!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Comentarios with ID #{params["id"]} Not Found"
      redirect_to "/comentarios"
    end
  end

  def destroy
    if comentarios = Comentarios.find params["id"]
      comentarios.destroy
    else
      flash["warning"] = "Comentarios with ID #{params["id"]} Not Found"
    end
    redirect_to "/comentarios"
  end

  def comentarios_params
    params.validation do
      required(:nome) { |f| !f.nil? }
      required(:email) { |f| !f.nil? }
      required(:texto) { |f| !f.nil? }
    end
  end
end
