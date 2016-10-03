class User < ActiveRecord::Base
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :reprocess_avatar, :if => :cropping?
	
	def cropping?
		!crop_x.blank? && !crop_y.blank? && !crop_h.blank? && !crop_w.blank?
	end
	
	has_many :pictures
	has_many :likes
	mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  private
  
  def reprocess_avatar
  	avatar.recreate_versions!
  end
end