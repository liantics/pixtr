class GalleriesController < ApplicationController
	def index
		#use the model name, not the db name - singular
		#
		@galleries = Gallery.all
	end
end
