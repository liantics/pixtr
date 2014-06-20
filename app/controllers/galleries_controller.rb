class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    params_with_user_id = gallery_params.merge(user_id: current_user.id) #current_user.id is a helper method from monban
    @gallery = Gallery.new(params_with_user_id)

    #
    # or this syntax has the same effect as the two lines above:
    # @gallery = Gallery.new(gallery_params.
    #   merge(user_id: current_user.id)
    # )
    # 

    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    # This finds *all* the galleries
    # @gallery = Gallery.user.find(params_with_user_id)
    # but we want to narrow the scope to the galleries 
    # owned by the currrent user
    #so we use the current user info provided by the monban auth code
    @gallery = current_user.galleries.find(params[:id]) #.find gets ONLY 1 gallery
  end

  def update
    @gallery = current_user.galleries.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    gallery = current_user.galleries.find(params[:id])
    gallery.destroy
    redirect_to root_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(
      :name,
      :description,
    )
  end
end