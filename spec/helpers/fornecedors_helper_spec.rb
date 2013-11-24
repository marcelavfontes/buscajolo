require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the FornecedorsHelper. For example:
#
# describe FornecedorsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe FornecedorsHelper do
	before :each do
		@cimento = FactoryGirl.create(:produto, nome: "cimento", id: "1")
		@tijolo = FactoryGirl.create(:produto, nome: "tijolo", id: "2")
		@brita = FactoryGirl.create(:produto, nome: "brita", id: "3")

	  @saci = FactoryGirl.create(:fornecedor, nome: "Saci", produtos: [@cimento, @tijolo, @brita])
	end
  it 'deve retornar uma string representando a lista de produtos que o fornecedor tem' do
	  produtos_string(@saci).should == "cimento, tijolo, brita"
  end

  it 'deve retornar uma string com o html com labels diferenciadas para os produtos do fornecedor que o usuario buscou' do
    html = '<span class="label label-primary">cimento</span><span class="label label-default">tijolo</span><span class="label label-primary">brita</span>'
    produtos = ['1','3']
	  produtos_html(@saci, produtos).should == html
  end
end
