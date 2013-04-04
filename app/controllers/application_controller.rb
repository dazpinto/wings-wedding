class ApplicationController < ActionController::Base
  protect_from_forgery

  def has_session
    redirect_to new_session_path unless Rsvp.find_by_code(session[:user_code])
  end
end
