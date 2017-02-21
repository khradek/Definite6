class Events::PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy] 

  respond_to :html

  def destroy_multiple 
    @event = Event.find(params[:event_id])   

    Play.destroy(params[:play_ids])

    respond_to do |format|
      format.html { redirect_to @event }
    end
  end

  def update_multiple
    @event = Event.find(params[:event_id])
    @plays = Play.find(params[:play_ids])

    if params[:periods] == '1'
      @plays.each do |play|
        play.update_attribute('period1', params[:play][:period1]) 
        play.update_attribute('period2', params[:play][:period2])
        play.update_attribute('period3', params[:play][:period3])
        play.update_attribute('period4', params[:play][:period4])
      end
    end

    if params[:types] == '1'
      @plays.each do |play|
        play.update_attribute('play_type', params[:play][:play_type])
      end
    end

    if params[:hashes] == '1'
      @plays.each do |play|
        play.update_attribute('hash_mark', params[:play][:hash_mark])
      end
    end

    if params[:situation_1] == '1'
      @plays.each do |play|
        play.update_attribute('situation1', params[:play][:situation1])
      end
    end

    if params[:situation_2] == '1'
      @plays.each do |play|
        play.update_attribute('situation2', params[:play][:situation2])
      end
    end   

    if params[:situation_3] == '1'
      @plays.each do |play|
        play.update_attribute('situation3', params[:play][:situation3])
      end
    end

    if params[:situation_4] == '1'
      @plays.each do |play|
        play.update_attribute('situation4', params[:play][:situation4])
      end
    end

    if params[:situation_5] == '1'
      @plays.each do |play|
        play.update_attribute('situation5', params[:play][:situation5])
      end
    end 

     if params[:situation_6] == '1'
      @plays.each do |play|
        play.update_attribute('situation6', params[:play][:situation6])
      end
    end

    if params[:situation_7] == '1'
      @plays.each do |play|
        play.update_attribute('situation7', params[:play][:situation7])
      end
    end   

    if params[:situation_8] == '1'
      @plays.each do |play|
        play.update_attribute('situation8', params[:play][:situation8])
      end
    end

    if params[:situation_9] == '1'
      @plays.each do |play|
        play.update_attribute('situation9', params[:play][:situation9])
      end
    end

    if params[:situation_10] == '1'
      @plays.each do |play|
        play.update_attribute('situation10', params[:play][:situation10])
      end
    end                

    respond_to do |format|
      format.html { redirect_to @event }
    end
  end

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
    @event = Event.includes(:scripts).find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @play = Play.new(play_params)
    @play.user = current_user
    @play.event = @event

    respond_to do |format|
      if @play.save
        @period1_count = @event.plays.where(:period1 => true).count
        @period2_count = @event.plays.where(:period2 => true).count
        @period3_count = @event.plays.where(:period3 => true).count
        @period4_count = @event.plays.where(:period4 => true).count
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
        format.html { redirect_to @event, info: 'The play was successfully updated.' }
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
        format.html { redirect_to @event, info: "The play was deleted successfully." }
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

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @play.user != current_user   
    end  
end
