class Image < ActiveRecord::Base
	belongs_to :gallery #enables us to use the methods for the foreign key

	validates :url, presence: true
	validates :gallery, presence: true #thanks to "belongs_to" above, we can access the gallery associated with the gallery_id for this image. This allows the validates method for gallery to run
end