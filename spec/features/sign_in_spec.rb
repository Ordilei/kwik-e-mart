require "spec_helper"

describe "Login" do 
	context "Login valido" do
		before do

			@user = FactoryGirl.create(:user)

			visit "/"
			click_link "Acessar minha conta"

			fill_in "Seu email", :with => @user.email
			fill_in "Sua senha", :with => "test"
			click_button I18n.t("form.button.login")
		end 

		# it "redirecionar para home" do
		# 	#expect(current_path).to eql("/")
		# end

		# it "mostrar a pagina incial" do 
		# 	expect().to have_content("Ola test")
		# end

		# it "esconde o link de login" do
		# 	expect(page).not_to have_content("Acessar minha conta")
		# end
	end

	context "Login invalido" do 
		it "validar login page"
		it "mostra a pagina de error"
	end

	context "Logado com sucesso" do
		it "redirecionar para a home page"
	end 
end