class Picture < ActiveRecord::Base
	belongs_to :user
	has_many :likes
	
	mount_uploader :image_url, PhotoUploader
	validates_presence_of :image_url
end
