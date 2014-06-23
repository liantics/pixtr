class CommentsController < ApplicationController

  def create
    #need the gallery to be passed in here, in order to get a foreign key into the
    #image record in the DB.
    @image = Image.find(params[:image_id])
    @comment = Comment.new(comment_params)
    @comment.image = @image #create a new image that has the gallery id of this gallery
    

    if @comment.save
      redirect_to @image
    else
      @comments = @image.comments.recent
      render "images/show" #render requires a template, this gives it the path of the related template

    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body, 
    ).merge(user_id: current_user.id)
  end

end