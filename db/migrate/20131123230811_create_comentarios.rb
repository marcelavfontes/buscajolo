class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :titulo
      t.string :texto
      t.integer :user_id

      t.timestamps
    end
  end
end
