class CreateFornecedorsAndProdutos < ActiveRecord::Migration
  def change
    create_table :fornecedors_produtos do |t|
      t.belongs_to :fornecedor
      t.belongs_to :produto
    end
  end
end
