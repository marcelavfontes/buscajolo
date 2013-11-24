require "spec_helper"

RSpec::Matchers.define :permitir do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do
  describe "as guest" do
    subject { Permission.new(nil) }
    
    it { should permitir("busca", "index") }
    it { should permitir("busca", "results") }
    it { should permitir("devise/sessions", "anything") }
    it { should permitir("devise/registrations", "anything") }
    it { should permitir("analises", "index") }
    it { should permitir("analises", "show") }
    it { should permitir("fornecedors", "index") }
    it { should permitir("fornecedors", "show") }
    it { should permitir("produtos", "index") }
    it { should permitir("produtos", "show") }
    it { should permitir("omniauth_callback", "anything") }

    it { should_not permitir("analises", "new") }
    it { should_not permitir("analises", "create") }
    it { should_not permitir("analises", "edit") }
    it { should_not permitir("analises", "update") }
    it { should_not permitir("analises", "destroy") }

    it { should_not permitir("fornecedors", "new") }
    it { should_not permitir("fornecedors", "create") }
    it { should_not permitir("fornecedors", "edit") }
    it { should_not permitir("fornecedors", "update") }
    it { should_not permitir("fornecedors", "destroy") }

    it { should_not permitir("produtos", "new") }
    it { should_not permitir("produtos", "create") }
    it { should_not permitir("produtos", "edit") }
    it { should_not permitir("produtos", "update") }
    it { should_not permitir("produtos", "destroy") }

  end
  
  describe "as admin" do
    subject { Permission.new(FactoryGirl.build(:user, admin: true)) }
    
    it { should permitir("anything", "here") }
  end
  
  describe "as member" do
    subject { Permission.new(FactoryGirl.build(:user, admin: false)) }
    
    it { should permitir("busca", "index") }
    it { should permitir("busca", "results") }
    it { should permitir("devise/sessions", "anything") }
    it { should permitir("devise/registrations", "anything") }

    it { should permitir("analises", "index") }
    it { should permitir("analises", "show") }
    it { should permitir("analises", "new") }
    it { should permitir("analises", "create") }
    it { should permitir("analises", "edit") }
    it { should permitir("analises", "update") }

    it { should permitir("fornecedors", "index") }
    it { should permitir("fornecedors", "show") }
    it { should permitir("produtos", "index") }
    it { should permitir("produtos", "show") }
    it { should permitir("omniauth_callback", "anything") }
    

    it { should_not permitir("analises", "destroy") }

    it { should_not permitir("fornecedors", "new") }
    it { should_not permitir("fornecedors", "create") }
    it { should_not permitir("fornecedors", "edit") }
    it { should_not permitir("fornecedors", "update") }
    it { should_not permitir("fornecedors", "destroy") }

    it { should_not permitir("produtos", "new") }
    it { should_not permitir("produtos", "create") }
    it { should_not permitir("produtos", "edit") }
    it { should_not permitir("produtos", "update") }
    it { should_not permitir("produtos", "destroy") }

  end
end