class Picture < ActiveRecord::Base	
	attr_accessor :tag_names
	
	belongs_to :user
	has_and_belongs_to_many :tags, uniq: true
	
	acts_as_votable
	mount_uploader :image_url, PhotoUploader
	
	validates :image_url, presence: true
	
	def tag_names=(names)
		@tag_names = names
		filtered = names.gsub(/[\,\.]/, "")
		filtered.split.each do |name|
			self.tags << Tag.find_or_initialize_by(name: name)
		end
	end
	
	def get_tags
		self.tags.map(&:name).join(', ')
	end
end