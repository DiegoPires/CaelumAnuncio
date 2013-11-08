# encoding: utf-8
class AnunciosController < ApplicationController
  before_filter :carrega_e_autoriza
  before_filter :authenticate_user!
  
  def create
    @anuncio.anunciante = current_user
    if @anuncio.save
      flash[:notice] = "Seu anuncio foi cadastrado"
      redirect_to root_path
    else
      @anuncio.build_marca
      @marcas = Marca.por_nome
    end
  end

  def new
    
  end

  def edit
    @marcas = Marca.por_nome
  end

  def update 
    if @anuncio.update_attributes params_anuncio
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
      @anuncio = Anuncio.new params_anuncio
    else 
      @anuncio = Anuncio.find params[:id]
    end

    authorize! action, @anuncio
  end

  def params_anuncio
    is_existent_marca = params[:anuncio][:marca_attributes] && !params[:anuncio][:marca_attributes][:nome].empty?

    if is_existent_marca
      attribute = {:marca_attributes => [:nome] }
    else
      attribute = :marca_id
    end

    params.require(:anuncio).permit(:ano, :descricao, :modelo, :valor, attribute)
  end
end
