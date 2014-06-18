class ImagesController < ApplicationController

	def new
		@gallery = Gallery.find(params[:gallery_id])
		@image = Image.new
	end

	def create
		@gallery = Gallery.find(params[:gallery_id]) #gallery id is in the url
		@image = Image.new(image_params)
		# every place we do a validation on a form, we'll need one of these if clauses:
		if @image.save 
			redirect_to gallery
		else 
			render :new
		end
	end

	def destroy
		gallery = Gallery.find(params[:gallery_id])
		image = gallery.images.find(params[:id])
		image.destroy
		redirect_to gallery
	end

	def edit
		@gallery = Gallery.find(params[:gallery_id])
		@image = @gallery.images.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:gallery_id])
		@image = @gallery.images.find(params[:id])

		if @image.update(image_params)
			redirect_to @gallery
		else
			render :edit
		end
	end

private
def image_params
    	params.
    		require(:image).
    		permit(:url, ).
    		merge(gallery_id: params[:gallery_id])
 	end

end