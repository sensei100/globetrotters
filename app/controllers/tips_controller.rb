class TipsController < ApplicationController

  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find(params[:id])
  end

  def new
    if !current_user
      redirect_to tips_path, alert: "You must be logged in to add a travel tip"
    else
      @tip = Tip.new
    end
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.user_id = current_user[:id]
    
    if @tip.save
      redirect_to @tip
    else
      render 'new'
    end
  end

  def destroy 
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to tips_path
   end

  private

  def tip_params
    params.require(:tip).permit(:name, :content, :user_id)
  end

end