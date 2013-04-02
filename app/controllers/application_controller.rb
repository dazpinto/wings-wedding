class ApplicationController < ActionController::Base
  protect_from_forgery

  def has_session
    puts "sessssssssssssssssssssssssssssssss"
    puts Rsvp.find_by_code(session[:user_code]) == nil
    redirect_to new_session_path if Rsvp.find_by_code(session[:user_code]) == nil
  end
end
