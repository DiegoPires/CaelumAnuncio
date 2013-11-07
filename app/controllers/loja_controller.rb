class LojaController < ApplicationController
  def principal
    @anuncio = Anuncio.new
    @anuncios = Anuncio.includes(:anunciante).all
  end
end
