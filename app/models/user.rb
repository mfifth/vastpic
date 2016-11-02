class User < ActiveRecord::Base
	acts_as_voter
	
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
end