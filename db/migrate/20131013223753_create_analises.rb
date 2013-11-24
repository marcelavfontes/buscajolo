class CreateAnalises < ActiveRecord::Migration
  def change
    create_table :analises do |t|
      t.string :titulo
      t.string :texto
      t.string :fornecedor_id
      t.timestamps
    end
  end
end
