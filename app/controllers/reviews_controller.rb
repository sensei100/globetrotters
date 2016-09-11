class ReviewsController < ApplicationController

  def index
    @reviews = Review.top_pick
    @destinations = Destination.all
  end

  def show
    @review = Review.find(params[:id])
    @destination = Destination.find(params[:destination_id])
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end

end