require "spec_helper"

describe "Cadastro" do
	context "Quando tiver dados validos" do
		before do

			visit "/"
			click_link "Cadastro"
			fill_in "Seu nome", :with => "jonis"
			fill_in "Seu email", :with => "email@test.com.br"
			fill_in "Sua senha", :with => "123456"
			fill_in "Sua confirmacao de senha", :with => "123456"
			click_button "Cadastrar"
		end

		it "redirecionado para pagina de login" do
			expect(current_path).to eql ("/login")
		end

		it "ver mensagem de sucesso" do 
			expect(page).to have_content(I18n.t("flash.users.create.notice"))
		end

	end

	context "Com dados invalidos" do
		before do
			visit "/"
			click_link "Cadastro"
			click_button "Cadastrar"
		end

		it "Validar formulario de cadastro" do
			expect(current_path).to eql("/signup")
		end 

		it "exibir mensagem de erro" do 
			expect(page).to have_content("O formulario contem erros")
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
				visit "/signup"
		end

		it "bate na url de cadastro e redirecionado para a home page" do
			expect(current_path).to eql("/")
		end

	end 

end