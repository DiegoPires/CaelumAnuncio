class Marca < ActiveRecord::Base
  attr_accessible :nome
  has_many :anuncio
end
