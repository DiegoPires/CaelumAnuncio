# encoding: utf-8
class AnunciosController < ApplicationController
  before_filter :load_pagina, :only => [:edit, :update, :delete, :destroy]

  def create
    @anuncio = Anuncio.new params[:anuncio]

    if @anuncio.save
      flash[:notice] = "Seu anuncio foi cadastrado"
      redirect_to root_path
    end
  end

  def edit
  end

  def update 
    if @anuncio.update_attributes params[:anuncio]
      flash[:notice] = "Anuncio atualizado"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def delete
  end

  def destroy 
    if @anuncio.destroy
      flash[:notice] = "Excluido"
      redirect_to root_path
    end
  end

  private
  def load_pagina
    @anuncio = Anuncio.find params[:id]
  end
end
