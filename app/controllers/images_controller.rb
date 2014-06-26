class ImagesController < ApplicationController


    def show
      @image = Image.find(params[:id])
      @groups = Group.all
      @comment = Comment.new
      @comments = @image.comments.recent
    end


    def new
      @gallery = current_user.galleries.find(params[:gallery_id])
      @image = Image.new
    end
    

    def create
      #need the gallery to be passed in here, in order to get a foreign key into the
      #image record in the DB.
      @gallery = current_user.galleries.find(params[:gallery_id])
      @image = @gallery.images.new(image_params) #create a new image that has the gallery id of this gallery

      if @image.save
        redirect_to @gallery
      else
        render :new
      end

    end

    def edit
      # adding this line:
      #    has_many :images, through: :galleries
      # to our user model gives us the ability to access 
      # an image that belongs to a gallery
      # that belongs to that user through the galleries, 
      # object. This makes it so we don't need
      # to create and pass around a galleries variable
      # in order to access this user's images
      @image = current_user.images.find(params[:id])
    end

    def update
      @image = current_user.images.find(params[:id])

      if @image.update(image_params)
        redirect_to @image.gallery #the belongs_to in the image model gives us the gallery method
      else
        render :edit
      end

    end

    def destroy
      gallery = current_user.galleries.find(params[:gallery_id])
      image = gallery.images.find(params[:id])
      image.destroy
      redirect_to gallery
    end

  private

    def image_params
      params.
        require(:image).
        permit(:url, :tag_list, group_ids: [])
    end

end