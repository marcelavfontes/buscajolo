class Produto < ActiveRecord::Base
  has_and_belongs_to_many :fornecedors	
  attr_accessible :nome

  def self.todos_nomes_e_ids
    Produto.all.map{|p| [p.nome, p.id]}
  end

  
end
