class BookingsController < ApplicationController
  def index
   @bookings = current_user.received_bookings
  end
end
