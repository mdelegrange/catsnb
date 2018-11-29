class BookingsController < ApplicationController
  before_action :set_cat, only: [ :new, :create ]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.cat = @cat
    @booking.status = "pending"
    @booking.user = current_user
    if @booking.end_date.present? && @booking.begin_date.present?
      @booking.total_price = @cat.price_per_day * (@booking.end_date - @booking.begin_date)
    end

    if @booking.save

      redirect_to bookings_path
    else
      render 'cats/show'
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
