class Events::PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @event = Event.find(params[:event_id]) 
    @plays = Play.all
    respond_with(@plays)
  end

  def show
    @event = Event.find(params[:event_id])
    @plays = Play.all
    respond_with(@play)
  end

  def new
    @event = Event.find(params[:event_id])
    @play = current_user.plays.build
    respond_with(@play)
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @play = Play.new(play_params)
    @play.user = current_user
    @play.event = @event

    respond_to do |format|
      if @play.save
        format.html { redirect_to @event, notice: 'The play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
        format.js
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @play.update(play_params)
    
    respond_to do |format|
      if @play.update(play_params)
        format.html { redirect_to @event, notice: 'The play was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
        format.js 
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @play = Play.find(params[:id])

    respond_to do |format|
      if @play.destroy
        format.html { redirect_to @event, notice: "The play was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the play." }
        format.js
      end
    end  
  end

  def sort
    params[:order].each do |key,value|
      Play.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    def set_play
      @play = Play.find(params[:id])
    end

    def play_params
      params.require(:play).permit(:piece1, :piece2, :priority, :event_id, :user_id, :period1, :period2, :period3, :period4, :situation1, :situation2, :situation3, :situation4, :situation5, :situation6, :situation7, :situation8, :situation9, :situation10, :play_type, :hash_mark)
    end
end
