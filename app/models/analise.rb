class Analise < ActiveRecord::Base
	belongs_to :fornecedor
	belongs_to :user
	has_many :comentarios

  attr_accessible :texto, :titulo

end
