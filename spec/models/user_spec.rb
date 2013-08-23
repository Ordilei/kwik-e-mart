require 'spec_helper'

describe User do
  context "validacoes no usuario" do 
  	it "validacao do nome" do
  		user = User.create(:name => nil)
  		expect(user).to have(1).error_on(:name)
  	end
  	
  	it "validacao do email" do
  		user = User.create(:email => nil)
  		expect(user).to have(1).error_on(:email)
  	end

  	it "validacao formato email" do
  		user = User.create(:email => "invalid")
  		expect(user).to have(1).error_on(:email)
  	end

  	 it "validacao formato email com sucesso" do
  		user = User.create(:email => "teste@test.com.br")
  		expect(user).to have(:no).error_on(:email)
  	end

  	it "validacao de senha nula" do
  		user = User.create(:password => nil)
  		expect(user).to have(1).error_on(:password)
  	end

  	it "validacao de confirmacao de senha" do
  		user = User.create(:password => "test",
  			:password_confirmation => "invalid")
  		expect(user).to have(1).error_on(:password)
  	end

  	it "validacao de email unico" do
  		existing = User.create!({
  			:name => "teste",
  			:email => "teste@test.com.br",
  			:password => "123456",
  			:password_confirmation => "123456"
  			})

  		user = User.create(:email => existing.email)
  		expect(user).to have(1).error_on(:email)

  	end
  end
end
