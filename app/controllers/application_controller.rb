class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :add_header_text
  
  def add_header_text
  	@ievents = Event.where(:event_type => "Install").where(:user_id => current_user.id).order(:start_time => :desc) if user_signed_in?
  end

  def after_sign_in_path_for(resource)
  	events_path
	end

end
