# encoding: utf-8
class AnunciosController < ApplicationController
  before_filter :load_pagina, :only => [:edit, :update, :delete, :destroy, :approve]
  before_filter :authenticate_user!
  before_filter :restrito_por_anunciante, except: :create

  def create
    @anuncio = Anuncio.new params[:anuncio]
    @anuncio.anunciante = current_user
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

  def self.all_from_user
    Anuncio.where(anunciante_id: current_user.id)
  end

  def destroy 
    if @anuncio.destroy
      flash[:notice] = "Excluido"
      redirect_to root_path
    end
  end

  def approve
    if @anuncio.update_attribute :aprovado, true
      flash[:notice] = "anuncio aprovado"
      redirect_to root_path
    end
  end

  private
  def load_pagina
    @anuncio = Anuncio.find params[:id]
  end

  def restrito_por_anunciante
    anunciante = Anuncio.find(params[:id]).anunciante
    redirect_to root_path unless anunciante == current_user
  end
end
