class DestinationsController < ApplicationController

  def index
    @destinations = Destination.alphabetically
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    if !current_user
      redirect_to destinations_path, alert: "You must be logged in to add a destination"
    else
      @destination = Destination.new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    destination_params[:reviews_attributes].merge(user_id: current_user.id)
    @destination = Destination.new(destination_params)
    
    if @destination.save
      redirect_to @destination
    else
      render 'new'
    end
  end

  def update
    @destination = Destination.find(params[:id])

    if @destination.update(destination_params)
      redirect_to @destination
    else
      render 'edit'
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :region, :country, review_ids: [], reviews_attributes: [:rating, :content, :user_id])
  end

end
