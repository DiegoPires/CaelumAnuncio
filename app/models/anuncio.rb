class Anuncio < ActiveRecord::Base
  attr_accessible :aprovado, :ano, :descricao, :modelo, :valor
  validates_presence_of :modelo, :descricao
  belongs_to :anunciante, class_name: "User"

  scope :aprovados, -> { includes(:anunciante).where(aprovado:true) }
end
