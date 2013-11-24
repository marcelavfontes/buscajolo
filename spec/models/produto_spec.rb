require 'spec_helper'

describe Produto do
  it 'deve retornar todos os nomes e ids de produtos existentes' do
		@cimento = FactoryGirl.create(:produto, nome: "cimento", id: "1")
		@tijolo = FactoryGirl.create(:produto, nome: "tijolo", id: "2")
		@brita = FactoryGirl.create(:produto, nome: "brita", id: "3")
  	Produto.todos_nomes_e_ids.should == [["cimento", 1],["tijolo", 2],["brita", 3]]
  end

  it "pode ser instanciado" do
  	Produto.new.should be_an_instance_of(Produto)
  end

  it "pode ser salvo com sucesso" do
  	Produto.create.should be_persisted
  end
end
