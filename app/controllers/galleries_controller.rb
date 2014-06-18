class GalleriesController < ApplicationController
	def index
		#use the model name, not the db name - singular
		#
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
	end

	def create
		gallery = Gallery.new(gallery_params) #initialize a new gallery instance with all the stuff typed in by the user
		if gallery.save #returns nil if save is unsuccessful
			#a not nil response means the save worked, send user to the new gallery page
			redirect_to "/galleries/#{gallery.id}"
		else
			#save returned nil, so saving failed
			#render saves any data from fields that have been filled in.
			#we can now set a variable to pass the data to the view.
			@gallery = gallery
			render :new #renders the "new" template (the view new.html.erb) page, but doesn't redirect
		end
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		if @gallery.update(gallery_params)
			redirect_to @gallery
		else
			render :edit
		end

	end

	def destroy
		gallery = Gallery.find(params[:id])
		gallery.destroy
		redirect_to "/"
	end

private
	def gallery_params
    	params.require(:gallery).permit(
       		:name, 
    		:description, #always add this comma, so git won't track this unchanged line when you have to add a comma after adding a new attribute to the list
    		) #white lists the keys we want to accept
 	end


end