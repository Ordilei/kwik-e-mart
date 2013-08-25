require "spec_helper"

describe "Login" do 
	context "Login valido" do
		before do
			@user = users(:test1)

			visit "/"
			click_link "Acessar minha conta"

			fill_in "Seu email", :with => @user.email
			fill_in "Sua senha", :with => "test"
			click_button I18n.t("form.button.login")
		end 

		it "redirecionar para home" do
			expect(current_path).to eql("/")
		end

		it "mostrar a pagina incial" do 
			expect(page).to have_content("Ola, test")
		end

		it "esconde o link de login" do
			expect(page).not_to have_content("Acessar minha conta")
		end
	end

	context "Login invalido" do 
		
		before do
			@user = users(:test1)

			visit "/"
			click_link "Acessar minha conta"

			fill_in "Seu email", :with => @user.email
			fill_in "Sua senha", :with => "huashash"
			click_button I18n.t("form.button.login")
		end

		it "validar login page com senha invalida" do
			expect(current_path).to eql("/login")
		end

		it "exibe mensagem de error" do 
			expect(page).to have_content("Email ou senha invalidos")
		end

	end

	context "Quando o usuario estiver logado" do

		before do
			@user = users(:test1)
				visit "/"
				click_link "Acessar minha conta"

				fill_in "Seu email", :with => @user.email
				fill_in "Sua senha", :with => "test"
				click_button I18n.t("form.button.login")		
				visit "/login"
		end

		it "bate na pagina inicial redirecionar para a home page" do
			expect(current_path).to eql("/")
		end

	end 
end