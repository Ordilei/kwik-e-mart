require "spec_helper"

describe "SIgnup" do
	context "Quando tiver dados validos" do
		before do

			visit "/"
			click_link "Cadastro"
			fill_in "Seu Nome", :with => "jonis"
			fill_in "Seu Email", :with => "email@test.com.br"
			fill_in "Sua Senha", :with => "123456"
			fill_in "Sua Confirmacao de senha", :with => "123456"
			click_button "Quero me cadastrar"

		end

		it "redirecionado para pagina de login" do
			expect(current_path).to eql("/login")
		end
		it "ver mensagem de sucesso"

	end

	context "Com dados invalidos" do
		it "exibir formulario de cadastro"
		it "exibir mensagem de erro"
	end

end