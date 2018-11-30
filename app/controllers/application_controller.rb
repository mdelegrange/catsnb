class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
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

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
