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
   		if @user
      		login(@user)
      		flash[:notice] = "Successfully logged in."     
    	else
      		flash[:error] = "Incorrect email or password."  # <--- Add this flash error
      		redirect_to login_path
      	end
    end
    

	def show
		require_login
    	@user = User.find_by_id(params[:id])
 		if @user
      		login(@user)
      		flash[:notice] = "Successfully logged in."      
      	else
      		flash[:error] = "Incorrect email or password."  
      		redirect_to login_path
      end
  	end





private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
