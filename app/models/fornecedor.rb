class Fornecedor < ActiveRecord::Base
  has_and_belongs_to_many :produtos
  has_many :analises
  attr_accessible :cidade, :nome

  def lista_nomes_produtos
    self.produtos.map{|p| p.nome}
  end

  def self.search(params)
    for_nome = params[:fornecedor_nome]
    produtos = params[:produtos]

    if for_nome
      results = find(:all, :conditions => ['nome LIKE ?', "%#{for_nome}%"])
    else
      results = find(:all)
    end
    
    if produtos
      results.select {|f| (produtos - f.produtos.map{|p| p.id.to_s}).empty?}
    else
      results
    end

  end

end
