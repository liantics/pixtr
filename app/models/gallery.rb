class Gallery < ActiveRecord::Base
	#active record KNOWS how to iterate over anything listed in a "has_many"
	#line in this model. It handles the .each iteration for us in the code, else
	has_many :images
	validates :name, presence: true 
	validates :description, presence: true 
end
