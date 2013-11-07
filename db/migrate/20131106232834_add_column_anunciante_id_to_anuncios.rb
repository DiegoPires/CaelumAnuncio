class AddColumnAnuncianteIdToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :anunciante_id, :integer
  end
end
