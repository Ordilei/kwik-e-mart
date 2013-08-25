class SessionsController < ApplicationController
	before_filter :redirect_logged_user, :except => [:destroy]

	def new
	end

	def create
		user = Autentication
			.authenticate(params[:email], params[:password])

		if user
		reset_session
		session[:user_id] = user.id

		redirect_to "/"
		
		else
			flash.now[:alert] = "Email ou senha invalidos"
			render :new
		end 
	end

	def destroy
		reset_session
		redirect_to sign_in_path
	end
end