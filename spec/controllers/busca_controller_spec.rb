require "spec_helper"

describe BuscaController do
	describe 'busca fornecedor' do
    before :each do
			@fake_results = [double('fornecedor1'),double('fornecedor2')]
			@search_input = {"fornecedor_nome" => 'Saci', "produtos" => '[]', "controller"=>"busca", "action"=>"results"}
    end 
		it 'deve chamar o metodo no model fornecedor que faz a busca' do
			Fornecedor.should_receive(:search).with(@search_input).and_return(@fake_results)
	  	post :results, {"fornecedor_nome" => 'Saci', "produtos" => '[]'}
	  end
	  describe 'depois de uma busca valida' do
			before :each do
				Fornecedor.stub(:search).with(@search_input).and_return(@fake_results)
		  	post :results, {"fornecedor_nome" => 'Saci', "produtos" => '[]'}
			end 
		  it 'deve selecionar o template de resultados para renderizar' do
				response.should render_template('results')
			end
			it 'deve deixar os resultados da busca disponiveis para o template' do
		  	assigns(:fornecedores).should == @fake_results
			end
		end


	end

end
