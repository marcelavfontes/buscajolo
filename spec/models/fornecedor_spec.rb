require 'spec_helper'

describe Fornecedor do

  it "deve listar nomes dos produtos que contem" do
		cimento = FactoryGirl.create(:produto, nome: "cimento")
		tijolo = FactoryGirl.create(:produto, nome: "tijolo")
	  brita = FactoryGirl.create(:produto, nome: "brita")

	  saci = FactoryGirl.create(:fornecedor, nome: "Saci", produtos: [cimento, tijolo, brita])
	  saci.lista_nomes_produtos.should == ["cimento", "tijolo", "brita"]
  end

  describe "buscar fornecedores" do
  	before :each do
  		@cimento = FactoryGirl.create(:produto, nome: "cimento", id: "1")
  		@tijolo = FactoryGirl.create(:produto, nome: "tijolo", id: "2")
  		@brita = FactoryGirl.create(:produto, nome: "brita", id: "3")

  	  @saci = FactoryGirl.create(:fornecedor, nome: "Saci", produtos: [@cimento, @tijolo])
  		@vale = FactoryGirl.create(:fornecedor, nome: "Vale do Para", produtos: [@tijolo, @brita])
  		@pedre = FactoryGirl.create(:fornecedor, nome: "Pedrelandia", produtos: [@brita, @cimento])
  	end

  	it 'deve buscar por nome' do
  		input = {fornecedor_nome: 'S', produtos: []}
  		Fornecedor.search(input).should == [@saci]
  	end

  	 it 'deve buscar por produto' do
  		input = {fornecedor_nome: '', produtos: ["1"]}
  		Fornecedor.search(input).should == [@saci, @pedre]
  	end

  	it 'deve buscar por produto e nome' do
  		input = {fornecedor_nome: 'S', produtos: ["1"]}
  		Fornecedor.search(input).should == [@saci]
  	end

  	it 'deve retornar todos os fornecedores se os parametros forem vazios' do
  		input = {fornecedor_nome: '', produtos: []}
  		Fornecedor.search(input).should == [@saci, @vale, @pedre]
  	end
  end

  it "pode ser instanciado" do
  	Fornecedor.new.should be_an_instance_of(Fornecedor)
  end

  it "pode ser salvo com sucesso" do
  	Fornecedor.create.should be_persisted
  end

end
