class Marca < ActiveRecord::Base
  attr_accessible :nome
  has_many :anuncio
  scope :por_nome, -> { order(:nome) }
end
