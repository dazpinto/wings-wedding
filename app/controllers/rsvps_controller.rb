class RsvpsController < ApplicationController

  before_filter :has_session, :only => [:reply]

  before_filter :authenticate_admin!, :except => [:show, :reply, :update]

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rsvps }
    end
  end

  # GET /rsvps/1
  # GET /rsvps/1.json
  def show
    if admin_signed_in?
      @rsvp = Rsvp.find(params[:id])
    elsif Rsvp.find_by_code(session[:user_code])
      @rsvp = Rsvp.find_by_code(session[:user_code])
    else
      redirect_to new_session_path
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/new
  # GET /rsvps/new.json
  def new
    @rsvp = Rsvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rsvp }
    end
  end

  # GET /rsvps/1/edit
  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  def reply
    if session && session[:user_code]
      @rsvp = Rsvp.find_by_code(session[:user_code])
    end
    redirect_to new_session_path if @rsvp.nil?
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(params[:rsvp])

    respond_to do |format|
      if @rsvp.save
        format.html { redirect_to @rsvp, notice: 'Rsvp was successfully created.' }
        format.json { render json: @rsvp, status: :created, location: @rsvp }
      else
        format.html { render action: "new" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rsvps/1
  # PUT /rsvps/1.json
  def update
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        begin
          NotificationsMailer.rsvp_received(@rsvp).deliver 
        rescue
        end
        if admin_signed_in?
          format.html { redirect_to rsvps_path, notice: 'Rsvp was successfully updated.' }
        else  
          format.html { redirect_to @rsvp, notice: 'Rsvp was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsvps/1
  # DELETE /rsvps/1.json
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to rsvps_url }
      format.json { head :no_content }
    end
  end
end
