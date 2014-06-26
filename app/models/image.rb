class Image < ActiveRecord::Base
	  belongs_to :gallery
	  has_many :comments
	  has_many :group_images
	  has_many :groups, through: :group_images

	  has_many :likes

	  has_many :taggings
	  has_many :tags, through: :taggings

	  validates :url, presence: true
	  validates :gallery, presence: true


	def tag_list
	  tags.map { |t| t.tag_name }.join(',')
	end

	def tag_list=(new_value)
	  tag_names = new_value.split(',')
	  self.tags = tag_names.map { |name| Tag.find_or_create_by(tag_name: name) }
	  
	end

end