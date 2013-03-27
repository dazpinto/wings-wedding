class SongRequestsController < ApplicationController

  before_filter :has_session, :except =>[:index]

  # GET /song_requests
  # GET /song_requests.json
  def index
    @song_requests = SongRequest.order("created_at DESC").all

    @song_request = SongRequest.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @song_requests }
    end
  end

  # GET /song_requests/1
  # GET /song_requests/1.json
  def show
    @song_request = SongRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song_request }
    end
  end

  # GET /song_requests/new
  # GET /song_requests/new.json
  def new
    @song_request = SongRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song_request }
    end
  end

  # GET /song_requests/1/edit
  def edit
    @song_request = SongRequest.find(params[:id])
  end

  # POST /song_requests
  # POST /song_requests.json
  def create
    @song_request = SongRequest.new(params[:song_request])
    @song_requests = SongRequest.order("created_at DESC").all

    respond_to do |format|
      if @song_request.save
        format.html { redirect_to song_requests_path, notice: 'Song request was successfully created.' }
        format.json { render json: @song_request, status: :created, location: @song_request }
      else
        format.html { render action: "index" }
        format.json { render json: @song_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_requests/1
  # PUT /song_requests/1.json
  def update
    @song_request = SongRequest.find(params[:id])

    respond_to do |format|
      if @song_request.update_attributes(params[:song_request])
        format.html { redirect_to @song_request, notice: 'Song request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_requests/1
  # DELETE /song_requests/1.json
  def destroy
    @song_request = SongRequest.find(params[:id])
    @song_request.destroy

    respond_to do |format|
      format.html { redirect_to song_requests_url }
      format.json { head :no_content }
    end
  end
end
