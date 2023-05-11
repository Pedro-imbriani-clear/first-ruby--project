class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Pedro Imbriani"
    @meu_nome = params[:nome]

  end
end
