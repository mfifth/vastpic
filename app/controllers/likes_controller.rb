class LikesController < ApplicationController	
	before_action :authenticate_user!
	
	def create
		@picture = Picture.find(params[:picture_id])
		@like = Like.find_or_create_by(user_id: current_user.id, picture: @picture)
		
		respond_to do |format|
			format.html {redirect_to root_path, flash[:notice] = "Like has been created!"}
			format.js
		end
	end
	
	def destroy
		@picture = Picture.find(params[:id])
		@like = @picture.likes.where(user: current_user)
		@like.destroy_all
		
		respond_to do |format|
			format.html {redirect_to root_path, flash[:notice] = "Like has been removed."}
			format.js
		end
	end
end