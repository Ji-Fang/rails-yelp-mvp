class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def review

  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurant_url, notice: "Restaurant successfully deleted!"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :rating, :content)
  end
end
