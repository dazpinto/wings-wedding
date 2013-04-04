class SessionController < ApplicationController
  def new
  end

  def create
    @rsvp = Rsvp.find_by_code(params[:session][:code])

    if @rsvp
      session[:user_code] = @rsvp.code

      if @rsvp.filled_in
        redirect_to @rsvp
      else
        redirect_to rsvps_reply_path
      end
    else
      redirect_to new_session_path, notice: 'Invitation code cannot be found'
    end
  end
end
