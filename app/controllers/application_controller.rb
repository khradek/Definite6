class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :add_header_text
  before_action :masquerade_user!
  
  def add_header_text
  	@ievents = Event.where(:event_type => "Install").where(:user_id => current_user.id).order(:start_time => :desc) if user_signed_in?
  end

  def current_user_subscribed?
    user_signed_in? && current_user.subscribed?
  end

  helper_method :current_user_subscribed?
  
  #Redirect to calendar after user signs-in
  def after_sign_in_path_for(resource)
  	events_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    thank_you_path
  end

  #Bootstrap flash messages
  add_flash_types :success, :warning, :danger, :info
end
