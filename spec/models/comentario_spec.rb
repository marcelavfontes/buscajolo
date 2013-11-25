require 'spec_helper'

describe Comentario do
	it "pode ser instanciado" do
  	Comentario.new.should be_an_instance_of(Comentario)
  end

  it "pode ser salvo com sucesso" do
  	Comentario.create.should be_persisted
  end
end
