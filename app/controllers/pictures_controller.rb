class PicturesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :upvote, :unvote]
	before_action :verify_admin, only: [:featured]
	

	def index
		if params[:query]
			@pictures = Picture.search(params[:query]).order(params[:sort]).where(featured: true).uniq
		else
			@pictures = Picture.order(params[:sort]).where(featured: true)
		end
		
		@picture = Picture.new
		
		gon.img = Picture.get_random_picture
	end

	def new
		@picture = Picture.new
	end
	
	def edit
		@picture = Picture.find(params[:id])
		@tags = @picture.get_tags
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
	
	def update
		@picture = Picture.find(params[:id])
		if @picture.update(picture_params)
			flash[:notice] = "Picture has been updated successfully."
			redirect_to user_path(@picture.user)
		else
			flash.now[:alert] = "Picture was not updated."
			render 'edit'
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
		params.require(:picture).permit(:image_url, :user_id, :tag_names)
	end
	
	def verify_admin
		unless current_user.admin?
			flash[:alert] = "Sorry only an admin can perform this feature"
			redirect_to root_path
		end
	end
end