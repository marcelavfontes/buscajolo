class BuscaController < ApplicationController
  def index
    @produtos = Produto.all
  end

  def results
  	@fornecedores = Fornecedor.search(params)
  	@produtos_sel = params[:produtos]
  end
end
