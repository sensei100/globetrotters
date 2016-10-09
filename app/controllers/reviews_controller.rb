class ReviewsController < ApplicationController

  def index
    @reviews = Review.top_pick
    @destinations = Destination.alphabetically
  end

  def show
    if !current_user
      redirect_to root_path, alert: "You must be logged in to continue."
    else
      @review = Review.find(params[:id])
      @destination = Destination.find_by(params[:destination_id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @review }
      end
    end
  end

  def new
    @review = Review.new
    if !current_user
      redirect_to destinations_path, alert: "You must be logged in to add a review"
    else
      @review = Review.new  
    end
  end

  def edit
    @review = Review.find(params[:id])
    authorize @review
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.new(review_params)
    @review.user = current_user
    current_user.review_count += 1
    current_user.save
    
    if @review.save
      redirect_to destination_path(@destination)
    else
      render 'new', alert: "There was a problem submitting your review."
    end
  end

  def update
    @review = Review.find(params[:id])
    
    if @review.user = current_user
      @review.update(review_params)
      redirect_to destination_path(@review.destination)
    else
      render 'edit', alert: "You can only edit your own tips"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to reviews_path
  end

  def review_data
    @review = Review.find(params[:id])
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id, :destination_id)
  end

end