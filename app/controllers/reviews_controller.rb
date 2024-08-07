class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurants_path(@restaurants)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Restaurant.find(params[:restaurant_id])
    @review.destroy
    redirect_to restaurants_path(@review.restaurants), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
