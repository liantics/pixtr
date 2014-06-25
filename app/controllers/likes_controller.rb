class LikesController < ApplicationController
	def create
		
		image = Image.find(params[:image_id])
		current_user.like_it image
		redirect_to image
	end
	def destroy
		img = Image.find(params[:image_id])
		current_user.unlike_it(img)
		
		redirect_to img
	end
end
