class ReviewsController < ApplicationController
  def new
    # FIND THE RIGHT RESTAURANT
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_param)
    # we need to find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # we need to assign to the review
    @review.restaurant = @restaurant
    # save
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
    # redirect the user somewhere
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def review_param
    # {"authenticity_token"=>"[FILTERED]", "review"=>{"content"=>"Very good restaurant"}, "commit"=>"Create Review", "restaurant_id"=>"9"}
    # {"content"=>"Very good restaurant"}
    params.require(:review).permit(:content)
  end
end
