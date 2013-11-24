class AddAnalisesToComentarios < ActiveRecord::Migration
  def change
    add_column :comentarios, :analise_id, :string
  end
end
