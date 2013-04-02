class SessionController < ApplicationController
  def new
  end

  def create
    @rsvp = Rsvp.find_by_code(params[:session][:code])

    if @rsvp
      session[:user_code] = @rsvp.code
      redirect_to rsvps_reply_path
    else
      redirect_to new_session_path, notice: 'Invitation code cannot be found'
    end
  end
end
