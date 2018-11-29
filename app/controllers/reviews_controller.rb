class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking

    if @review.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @booking = Booking.find(params[:booking_id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :booking_id)
  end
end
