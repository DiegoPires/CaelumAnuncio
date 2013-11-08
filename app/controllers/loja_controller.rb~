class LojaController < ApplicationController
  def principal
    @anuncio = Anuncio.new { |a| a.build_marca }
    @marcas = Marca.por_nome
    @anuncios = if can?(:approve, Anuncio)
      Anuncio.includes(:anunciante).all
    else
      Anuncio.aprovados
    end
  end
end
