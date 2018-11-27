class Owner::BookingsController < ApplicationController

	def index
		@bookings = current_user.received_bookings
	end

	def accept
	end

	def deny
	end
end