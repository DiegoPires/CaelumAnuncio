class AddAprovadoToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :aprovado, :boolean, default: false
  end
end
