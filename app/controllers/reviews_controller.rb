class ReviewsController < ApplicationController

  def index
    @reviews = Review.top_pick
    @destinations = Destination.all
  end

  def show
    @review = Review.find(params[:id])
    @destination = Destination.find(params[:destination_id])
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit', alert: "You can only edit your own content."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end

end