class ReviewsController < ApplicationController

  def index
    @reviews = Review.top_pick
    @destinations = Destination.alphabetically
  end

  def show
    @review = Review.find(params[:id])
    @destination = Destination.find_by(params[:destination_id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    
    if @review.user = current_user
      @review.update(review_params)
      redirect_to review_path(@review)
    else
      render 'edit', alert: "You can only edit your own tips"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :destination_id)
  end

end