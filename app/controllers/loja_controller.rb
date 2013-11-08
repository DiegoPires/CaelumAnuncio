class LojaController < ApplicationController
  def principal
    @anuncio = Anuncio.new { |a| a.build_marca }
    @anuncios = if can?(:approve, Anuncio)
      Anuncio.includes(:anunciante).all
    else
      Anuncio.aprovados
    end
  end
end
