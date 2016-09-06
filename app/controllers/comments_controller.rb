class CommentsController < ApplicationController

  def create
    @destination = Destination.find(params[:destination_id])
    @comment = @destination.comments.create(comment_params)
    redirect_to destination_path(@destination)
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @comment = @destination.comments.find(params[:id])
    @comment.destroy
    redirect_to destination_path(@destination)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
