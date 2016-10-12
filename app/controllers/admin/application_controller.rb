class Admin::ApplicationController < ApplicationController
	def index
		if params[:query]
			@users = User.search(params[:query]).order("created_at DESC")
		end
	end
end
