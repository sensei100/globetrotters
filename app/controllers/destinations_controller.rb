class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def new
    @destination = Destination.new
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
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



  private

  def destination_params
    params.require(:destination).permit(:name, :region, :country)
  end

end
