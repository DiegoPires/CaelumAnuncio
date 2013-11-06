class Anuncio < ActiveRecord::Base
  attr_accessible :ano, :descricao, :modelo, :valor
  validates_presence_of :modelo, :descricao
end
