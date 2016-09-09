class CommentsController < ApplicationController

  def create
    @destination = Destination.find(params[:destination_id]) 
    @comment = @destination.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to destination_path(@destination)
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @comment = @destination.comments.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to destination_path(@destination)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
