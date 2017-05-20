class Events::GamecallsController < ApplicationController
  before_action :set_gamecall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy] 

  respond_to :html

  def custom_print
    @gamecall = Gamecall.find(params[:gamecall_id]) 
    @event = Event.find(params[:event_id]) 
  end

  def custom
    @gamecall = Gamecall.find(params[:gamecall_id]) 
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
    @sit1_plays = @event.plays.openers
    @sit2_plays = @event.plays.first_tens
    @sit3_plays = @event.plays.second_longs
    @sit4_plays = @event.plays.third_longs
    @sit5_plays = @event.plays.second_mediums
    @sit6_plays = @event.plays.third_mediums
    @sit7_plays = @event.plays.second_shorts
    @sit8_plays = @event.plays.third_shorts
    @sit9_plays = @event.plays.redzones
    @sit10_plays = @event.plays.goalines
    @sit11_plays = @event.plays.coming_outs
    @sit12_plays = @event.plays.custom_ones
    @sit13_plays = @event.plays.custom_twos
    @sit14_plays = @event.plays.custom_threes
  end

  def print
    @gamecall = Gamecall.find(params[:gamecall_id]) 
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
  end

  def index
    @event = Event.find(params[:event_id])    
    @gamecalls = Gamecall.all
    respond_with(@gamecalls)
  end

  def show
    @event = Event.find(params[:event_id])
    @gamecalls = Gamecall.all
    @plays = @event.plays
    respond_with(@gamecall)
  end

  def new
    @event = Event.find(params[:event_id])
    @gamecall = current_user.gamecalls.build
    @plays = @event.plays
    respond_with(@gamecall)
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @gamecall = Gamecall.new(gamecall_params)
    @gamecall.user = current_user
    @gamecall.event = @event

    respond_to do |format|
      if @gamecall.save
        format.html { redirect_to @event, notice: 'Game Call Sheet was successfully created.' }
        format.json { render :show, status: :created, location: @gamecall }
        format.js  
      else
        format.html { render :new }
        format.json { render json: @gamecall.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @gamecall.event = @event
    
    respond_to do |format|
      if @gamecall.update(gamecall_params)
        format.html { redirect_to @event, notice: 'Game Call Sheet was successfully updated.' }
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
    @gamecall = Gamecall.find(params[:id])

    respond_to do |format|
      if @gamecall.destroy
        format.html { redirect_to @event, notice: "The Game Call Sheet was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the Game Call Sheet." }
        format.js
      end
    end  
  end

  private
    def set_gamecall
      @gamecall = Gamecall.find(params[:id])
    end

    def gamecall_params
      params.require(:gamecall).permit(:title, :gdata, :gdata2, :event_id, :user_id, :start_time, :end_time, :gamecall_template, :col_widths1, :g_format1, :g_class1, :col_widths2, :g_format2, :g_class2)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @gamecall.user != current_user   
    end     
end
