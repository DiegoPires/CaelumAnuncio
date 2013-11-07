class LojaController < ApplicationController
  def principal
    @anuncio = Anuncio.new
    @anuncios = if can?(:approve, Anuncio)
      Anuncio.includes(:anunciante).all
    else
      Anuncio.aprovados
    end
  end
end
