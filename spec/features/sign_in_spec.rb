require "spec_helper"

describe "Login" do 
	context "Login valido" do
		before do
			visit "/"
			click_link "Acessar minha conta"

			fill_in "Seu email", :with => ""
			fill_in "Sua senha", :with => ""
			click_button "Logar"

		end 

		it "redirecionar para home" do
			expect(current_path).to eql("/")
		end
		it "mostrar a pagina incial"
		it "esconde o link de login"
	end

	context "Login invalido" do 
		it "validar login page"
		it "mostra a pagina de error"
	end

	context "Logado com sucesso" do
		it "redirecionar para a home page"
	end 
end