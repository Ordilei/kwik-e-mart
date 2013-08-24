class UsersController < ActionController::Base
  def new
  	@user = User.new
  end

  def create
  	@user = User.new
  	@user.name = nil
  	@user.save

  	flash[:notice] = t("flash.users.create.notice")
  	redirect_to "/login"
  	  
  end
end
