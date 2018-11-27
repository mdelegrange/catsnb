class BookingsController < ApplicationController
  before_action :set_cat, only: [:new, :create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total_price = @cat.price_per_day * (@booking.end_date - @booking.begin_date)
    @booking.cat = @cat
    @booking.status = "in progress"
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:message, :begin_date, :end_date)
  end

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end
end
