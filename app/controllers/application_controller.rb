class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :load_pending_bookings_count

  private

  def load_pending_bookings_count
    @pending_bookings_count = current_user.received_bookings.pending.count unless current_user.nil?
    # current_user.cats.each {|cat| count += cat.bookings.where(status: 'pending').count}
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
