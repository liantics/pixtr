class Gallery < ActiveRecord::Base
	belongs_to :user
	has_many :images

	 validates :name, presence: true
	 validates :description, presence: true
end
