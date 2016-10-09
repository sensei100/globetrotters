class CommentsController < ApplicationController
  before_action :set_destination

  def index
    @comments = @destination.comments.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
      respond_to do |format|
        format.html { render :show}
        format.json { render json: @comment}
      end
    end

  def create
    @comment = @destination.comments.new(comment_params)
    
    if !current_user
      redirect_to destination_path(@destination), alert: "You must be logged in to add a comment"
    else
      @comment.save
      render json: @comment, status: 201
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
