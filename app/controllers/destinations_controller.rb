class DestinationsController < ApplicationController
  before_filter :find_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.alphabetically
  end

  def show
    if !current_user
      redirect_to root_path, alert: "You must be logged in to continue."
    else
      @reviews = Destination.includes(:comments).last(5)
      @comments = Destination.includes(:comments).last(5)
    end
  end

  def new
    if !current_user
      redirect_to destinations_path, alert: "You must be logged in to add a destination"
    else
      @destination = Destination.new 
    end
  end

  def edit
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
    @destination.update(destination_params)
    redirect_to @destination
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :region, :country, reviews_attributes: [:rating, :content, :user_id])
  end

  def find_destination
    @destination = Destination.find(params[:id])
  end
end
