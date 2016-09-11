class DestinationsController < ApplicationController

  def index
    @destinations = Destination.alphabetically
  end

  def show
    @destination = Destination.find(params[:id])
    @reviews = Destination.includes(:comments).last(5)
    @comments = Destination.includes(:comments).last(5)
  end

  def new
    if !current_user
      redirect_to destinations_path, alert: "You must be logged in to add a destination"
    else
      @destination = Destination.new 
      @destination.reviews.build  
    end
  end

  def edit
    @destination = Destination.find(params[:id])
     @destination.reviews.build if !@destination.reviews.exists?
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.reviews.first.user = current_user
     
    if @destination.save
      redirect_to @destination
    else
      render 'new'
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    redirect_to @destination
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :region, :country, review_ids: [], reviews_attributes: [:rating, :content, :user_id] )
  end

end
