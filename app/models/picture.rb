class Picture < ActiveRecord::Base	
	acts_as_votable
	belongs_to :user
	
	mount_uploader :image_url, PhotoUploader
	validates :image_url, presence: true
end
