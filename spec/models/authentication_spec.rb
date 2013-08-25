require 'spec_helper'

describe Autentication do 
	
	context "Com credencias validas" do
		
		before do
			@user = FactoryGirl.create(:user)
		end

		it "retorna usuario" do
			authenticated_user = Autentication
				.authenticate(@user.email, "test")

			expect(authenticated_user).to eql(@user)
		end
	end

	context "Com email invalido" do

		it "deve retornar nulo" do 
			authenticated_user = Autentication
				.authenticate("invalido", "invalido")

			expect(authenticated_user).not_to be
		end
	end


	context "Com senha invalida" do 

		before do
			@user = FactoryGirl.create(:user)
		end

		it "deve retornar nulo" do
			authenticated_user = Autentication
				.authenticate(@user.email, "invalido")

			expect(authenticated_user).not_to be
		end

	end 
end