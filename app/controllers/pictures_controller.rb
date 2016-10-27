class PicturesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :upvote, :unvote]
	before_action :verify_admin, only: [:featured]
	

	def index
		@pictures = Picture.order(params[:sort]).where(featured: true)
		@picture = Picture.new
		
		gon.img = Picture.where(featured: true).sample.image_url.url
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.user = current_user
		
		if params[:picture].blank?
			flash.now[:alert] = "Picture must be selected."
			render 'new'
			return
		end

		if @picture.save
			flash[:success] = "Photo has been saved."
			redirect_to user_path(current_user)
		else
			flash.now[:alert] = "Photo was not uploaded."
			render 'new'
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		
		flash[:notice] = "Picture has been deleted."
		redirect_to user_path(@picture.user)
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
		params.require(:picture).permit(:image_url, :user_id)
	end
	
	def verify_admin
		unless current_user.admin?
			flash[:alert] = "Sorry only an admin can perform this feature"
			redirect_to root_path
		end
	end
end