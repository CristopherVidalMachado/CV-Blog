require "./spec_helper"

def comentarios_hash
  {"nome" => "Fake", "email" => "Fake", "texto" => "Fake"}
end

def comentarios_params
  params = [] of String
  params << "nome=#{comentarios_hash["nome"]}"
  params << "email=#{comentarios_hash["email"]}"
  params << "texto=#{comentarios_hash["texto"]}"
  params.join("&")
end

def create_comentarios
  model = Comentarios.new(comentarios_hash)
  model.save
  model
end

class ComentariosControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe ComentariosControllerTest do
  subject = ComentariosControllerTest.new

  it "renders comentarios index template" do
    Comentarios.clear
    response = subject.get "/comentarios"

    response.status_code.should eq(200)
    response.body.should contain("comentarios")
  end

  it "renders comentarios show template" do
    Comentarios.clear
    model = create_comentarios
    location = "/comentarios/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Comentarios")
  end

  it "renders comentarios new template" do
    Comentarios.clear
    location = "/comentarios/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Comentarios")
  end

  it "renders comentarios edit template" do
    Comentarios.clear
    model = create_comentarios
    location = "/comentarios/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Comentarios")
  end

  it "creates a comentarios" do
    Comentarios.clear
    response = subject.post "/comentarios", body: comentarios_params

    response.headers["Location"].should eq "/comentarios"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a comentarios" do
    Comentarios.clear
    model = create_comentarios
    response = subject.patch "/comentarios/#{model.id}", body: comentarios_params

    response.headers["Location"].should eq "/comentarios"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a comentarios" do
    Comentarios.clear
    model = create_comentarios
    response = subject.delete "/comentarios/#{model.id}"

    response.headers["Location"].should eq "/comentarios"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
