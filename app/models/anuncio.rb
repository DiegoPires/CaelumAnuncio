class Anuncio < ActiveRecord::Base
  #attr_accessible :aprovado, :ano, :descricao, :modelo, :valor, :marca_attributes
  validates_presence_of :modelo, :descricao
  belongs_to :anunciante, class_name: "User"
  belongs_to :marca
  accepts_nested_attributes_for :marca

  scope :aprovados, -> { includes(:anunciante).where(aprovado:true) }
end 
