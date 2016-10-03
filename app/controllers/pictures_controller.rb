class PicturesController < ApplicationController
	before_action :authenticate_user!, only: [:new]

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

	private

	def picture_params
		params.require(:picture).permit(:user, :image_url)
	end
	
	def liked_by?(user)
		self.likes.where(user: current_user).any?
	end
end