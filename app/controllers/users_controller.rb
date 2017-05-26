class UsersController < ApplicationController

	before_action :require_login, only: [:show]

	def index
		@users = User.all
	end

	def new
	@user = User.new
	end

	def create
	@user = User.create(user_params)
	login(@user) # <-- log the user in
    redirect_to @user
    
	end

	def show
    @user = User.find_by_id(params[:id])
    @current_user = @user
 		redirect_to '/login'
  	end





private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
