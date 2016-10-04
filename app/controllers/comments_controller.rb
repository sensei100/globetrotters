class CommentsController < ApplicationController
  before_action :set_destination

  def create
    @comment = @destination.comments.new(comment_params)
    
    if !current_user
      redirect_to destination_path(@destination), alert: "You must be logged in to add a comment"
    else
      @comment.save
      redirect_to destination_path(@destination)
    end
  end

  def destroy 
    @comment = @destination.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to destination_path(@destination)
  end

  private

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
