class Owner::BookingsController < ApplicationController
	before_action :set_booking, only: [:index, :accept, :deny]
	def index
	end

	def accept
		@booking = @bookings.find(params[:id])
		@booking.update(status: "accepted")
		redirect_to owner_bookings_path
	end

	def deny
		@booking = @bookings.find(params[:id])
		@booking.update(status: "denied")
		redirect_to owner_bookings_path
	end

	private

	def set_booking
		@bookings = current_user.received_bookings
	end
 
end