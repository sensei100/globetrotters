class ReviewsController < ApplicationController

  def index
    @reviews = Review.top_pick
  end

  def show
    @review = Review.find(params[:id])
  end

end