class Picture < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	
	mount_uploader :image_url, PhotoUploader
	validates_presence_of :image_url
end
