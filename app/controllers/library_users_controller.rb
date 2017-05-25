class LibraryUsersController < ApplicationController
	def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries # so we type less in the view
  	end
end
