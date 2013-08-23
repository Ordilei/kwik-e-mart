class UsersController < ActionController::Base
  def new
  	@user = User.new
  end

  def create
  	@user = User.new
  	@user.name = nil
  	@user.save

  	redirect_to "login"
  end
end
