class Comentario < ActiveRecord::Base
  attr_accessible :texto, :titulo, :user_id
  belongs_to :user
  belongs_to :analise
end
