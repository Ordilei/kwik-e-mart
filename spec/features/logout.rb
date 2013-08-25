require 'spec_helper'

describe "Logout" do
	context "quando o usuario estiver logado"	do
		before do
			@user = users(:test1)
				visit "/"
				click_link "Acessar minha conta"

				fill_in "Seu email", :with => @user.email
				fill_in "Sua senha", :with => "test"
				click_button I18n.t("form.button.login")		
				
				click_link "Sair"
		end

		it "redirecionar para pagina de login" do
			expect(current_path).to eql("/login")
		end
	end

	context "quando eu nao estiver logado" do
		before do
			visit "/logout"
		end
		it "redirecionar para pagina de login" do
			expect(current_path).to eql("/login")
		end
	end
end