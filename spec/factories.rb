FactoryGirl.define do
	factory :user do
		email "foo@example.com" 
    password "secret"
  end

  factory :fornecedor do
    nome "Saci"
    cidade "Natal"
    produtos []
  end

  factory :produto do
    nome "cimento"
  end

  factory :analise do
    titulo "bla bla"
    texto "bli bli"
  end

end
