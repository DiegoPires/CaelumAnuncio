# encoding: utf-8
class AnunciosController < ApplicationController
  before_filter :carrega_e_autoriza
  before_filter :authenticate_user!
  
  def create
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

  def destroy 
    if @anuncio.destroy
      flash[:notice] = "Excluido"
      redirect_to root_path
    end
  end

  def approve
    if @anuncio.update_attribute :aprovado, true
      flash[:notice] = "anuncio aprovado"
    end
    redirect_to root_path
  end

  private
  def carrega_e_autoriza
    action = params[:action].to_sym

    if action == :create
      @anuncio = Anuncio.new params[:anuncio]
    else 
      @anuncio = Anuncio.find params[:id]
    end

    authorize! action, @anuncio
  end
end
