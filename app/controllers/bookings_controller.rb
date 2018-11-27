class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]
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

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
