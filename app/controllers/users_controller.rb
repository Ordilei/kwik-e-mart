class UsersController < ApplicationController
  before_filter :redirect_logged_user
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		
  		flash[:notice] = t("flash.users.create.notice")
  		redirect_to sign_in_path

  	else
  		render :new
  	end
  	  
  end
end
