class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@pictures = @user.pictures
	end
end