class PicturesController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def index
		@pictures = Picture.all
		@picture = Picture.new
		
		gon.img = Picture.all.sample.image_url.url
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.user = current_user

		if @picture.save
			render json: { message: "success", fileID: @picture.id }, :status => 200
			redirect_to user_path(current_user)
		else
			render json: { error: @picture.errors.full_messages.join(',')}, :status => 400
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
end