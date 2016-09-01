class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.all
  end

end