class User < ActiveRecord::Base
	acts_as_voter
	
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :reprocess_avatar, :if => :cropping?
	
	def cropping?
		!crop_x.blank? && !crop_y.blank? && !crop_h.blank? && !crop_w.blank?
	end
	
	def self.search(query)
	  return none unless query.present?
	  query = "%#{query.strip}%"
	  where('first_name ILIKE ? OR username ILIKE ? or email ILIKE ?', query, query, query)
	end
	
	has_many :pictures
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