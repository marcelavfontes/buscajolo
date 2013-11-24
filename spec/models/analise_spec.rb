require 'spec_helper'

describe Analise do
  it "pode ser instanciado" do
  	Analise.new.should be_an_instance_of(Analise)
  end

  it "pode ser salvo com sucesso" do
  	Analise.create.should be_persisted
  end
end
