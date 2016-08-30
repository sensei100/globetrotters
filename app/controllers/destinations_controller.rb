class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
  end

  def new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.save
    redirect_to @destination
  end



  private

  def destination_params
    params.require(:destination).permit(:name, :region, :country)
  end

end
