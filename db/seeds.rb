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

users = [{:email => "rafael@gmail.com", :password => "rafael123"},{:email => "danilo@gmail.com", :password => "danilo123", :admin => true},{:email => "marcela@gmail.com", :password => "marcela123", :admin => true}]

users.each do |user|
  User.create!(user)
end

danilo = User.find_by_email("danilo@gmail.com")
marcela = User.find_by_email("marcela@gmail.com")
rafael = User.find_by_email("rafael@gmail.com")

analises = [{:titulo => "Nao gostei do atendimento", :texto => "Fui ate o fornecedor e fui muito mal tratado quando pedi por informacoes de produtos"},{:titulo => "Produto de ma qualidade", :texto => "Comprei uma grande quantidade do produto na loja, mas quando o utilizei, me arrependi da compra devido a ma qualidade dos mesmos."}]
analises.each do |a|
	analise = Analise.new(a)
	analise.user = danilo
	analise.fornecedor = saci
	analise.save!
end

analise1 = Analise.new :titulo => "Gostei muito e recomendo", :texto => "Material de muito boa qualidade e atendimento otimo."
analise1.user = marcela
analise1.fornecedor = valeDoPara
analise1.save!

analise2 = Analise.new :titulo => "Razoavel", :texto => "Nada acima da media. Recomendo procurar outra."
analise2.user = rafael
analise2.fornecedor = saci
analise2.save!

comentario1 = Comentario.new :titulo => "Concordo", :texto => "Tive uma experiencia muito parecida quando fui la."
comentario1.user = rafael
comentario1.analise = analise1
comentario1.save!

comentario2 = Comentario.new :titulo => "Obrigado pela informacao", :texto => "Ficarei atento."
comentario2.user = danilo
comentario2.analise = analise2
comentario2.save!




