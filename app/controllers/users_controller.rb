class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	
	def show
		@pictures = @user.pictures.order(params[:sort])
	end
	
	def edit
	end
	
	def update
		if @user.update(user_params)
			if params[:user][:avatar].present?
				flash[:notice] = "User has been updated."
				render 'crop'
			else
				flash[:notice] = "User has been updated."
				redirect_to @user
			end
		else
			flash.now[:alert] = "User has not been updated."
			render 'edit'
		end
	end
	
	private 
	
	def set_user
		@user = User.find(params[:id])
	end
	
	def user_params
		params.require(:user).permit(:username, :first_name, :user, 
		:last_name, :email, :location, :avatar, :about)
	end
end