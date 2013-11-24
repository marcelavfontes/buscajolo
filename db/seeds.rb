# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
produtos = [{:nome => "cimento"},{:nome => "concreto"}, {:nome => "areia"},
{:nome => "brita"},{:nome => "telha"},{:nome => "barra de aco"},
{:nome => "tijolo"}]

produtos.each do |produto|
  Produto.create!(produto)
end

fornecedores = [{:nome => "Pedrelandia", :cidade => "Natal"},
	{:nome => "Vale do Para", :cidade => "Natal"},
{:nome => "Saci", :cidade => "Natal"}]

fornecedores.each do |fornecedor|
  Fornecedor.create!(fornecedor)
end

cimento = Produto.find_by_nome("cimento")
concreto = Produto.find_by_nome("concreto")
areia = Produto.find_by_nome("areia")
brita = Produto.find_by_nome("brita")
telha = Produto.find_by_nome("telha")
barraDeAco = Produto.find_by_nome("barra de aco")
tijolo = Produto.find_by_nome("tijolo")

pedrelandia = Fornecedor.find_by_nome("Pedrelandia")
valeDoPara = Fornecedor.find_by_nome("Vale do Para")
saci = Fornecedor.find_by_nome("Saci")

pedrelandia.produtos = [cimento, concreto, brita, tijolo]
valeDoPara.produtos = [areia, brita, telha, tijolo]
saci.produtos = [cimento, brita, barraDeAco, tijolo]

users = [{:email => "rafael@gmail.com", :password => "rafael123"},{:email => "danilo@gmail.com", :password => "danilo123", :admin => true}]

users.each do |user|
  User.create!(user)
end

danilo = User.find_by_email("danilo@gmail.com")

analises = [{:titulo => "Nao gostei do atendimento", :texto => "Fui ate o fornecedor e fui muito mal tratado quando pedi por informacoes de produtos"},{:titulo => "Produto de ma qualidade", :texto => "Comprei uma grande quantidade do produto na loja, mas quando o utilizei, me arrependi da compra devido a ma qualidade dos mesmos."}]
analises.each do |a|
	analise = Analise.new(a)
	analise.user = danilo
	analise.fornecedor = saci
	analise.save!
end
