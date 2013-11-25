module FornecedorsHelper

  # retorna uma string representando todos os produtos que o fornecedor tem
  def produtos_string(fornecedor)
  	prod_st = ""
    fornecedor.lista_nomes_produtos.each do |p_st|
      prod_st << p_st + ", "
    end
    prod_st[0..-3]
  end

  # retorna uma string com o html com labels diferenciadas para os produtos do fornecedor que o usuario buscou
  def produtos_html(fornecedor, produtos)
    prod_html = ""
    if produtos 
      fornecedor.produtos.each do |p|
        if produtos.include? p.id.to_s
          prod_html << '<span class="label label-primary">' + p.nome + '</span>'
        else
          prod_html << '<span class="label label-default">' + p.nome + '</span>'
        end
      end
    else
      fornecedor.produtos.each do |p|
        prod_html << '<span class="label label-default">' + p.nome + '</span>'
      end
    end
    prod_html
  end


end
