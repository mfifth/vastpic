class PicturesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :upvote, :unvote]
	before_action :verify_admin, only: [:featured]
	

	def index
		@pictures = Picture.where(featured: true)
		@picture = Picture.new
		
		gon.img = Picture.where(featured: true).sample.image_url.url
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.user = current_user

		if @picture.save
			flash[:success] = "Photo has been saved."
			redirect_to user_path(current_user)
		else
			flash.now[:alert] = "Photo was not uploaded."
			render 'new'
		end
	end

	def destroy
		
	end

	def license
		
	end
	
	def featured
		@picture = Picture.find(params[:id])
		@picture.featured = true
		@picture.save
		
		flash[:notice] = "Picture has been set to featured."
		redirect_to root_path
	end
	
	def upvote
		@picture = Picture.find(params[:id])
		@picture.liked_by(current_user)
		
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js
		end
	end
	
	def unvote
		@picture = Picture.find(params[:id])
		@picture.unliked_by(current_user)
		
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js
		end
	end

	private

	def picture_params
		params.require(:picture).permit(:user, :image_url)
	end
	
	def verify_admin
		unless current_user.admin?
			flash[:alert] = "Sorry only an admin can perform this feature"
			redirect_to root_path
		end
	end
end