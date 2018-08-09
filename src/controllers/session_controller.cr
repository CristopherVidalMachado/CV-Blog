class SessionController < ApplicationController
  def new
    render("new.slang")
  end

  def create
    render("create.slang")
  end

  def delete
    render("delete.slang")
  end
end
