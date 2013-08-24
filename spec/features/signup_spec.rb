require "spec_helper"

describe "SIgnup" do
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
		it "exibir formulario de cadastro"
		it "exibir mensagem de erro"
	end

end