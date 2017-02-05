class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :subscribed_user

  respond_to :html, :js, :json

  def print
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
  end

  def sortable
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
  end

  def index
    @events = Event.where(:user_id => current_user.id)    
    @ievents = Event.where(:event_type => "Install").where(:user_id => current_user.id).order(:start_time => :desc)
    @event = current_user.events.build
    respond_with(@events)
  end

  def show
    @event = Event.find(params[:id])
    @gamecalls = @event.gamecalls.order(:start_time => :asc)    
    @scripts = @event.scripts.order(:start_time => :asc)  
    @gamecall_count = @event.gamecalls.count
    @plays = @event.plays.order(:priority => :asc, :created_at => :asc)
    @new_play = @event.plays.build
    @new_script = @event.scripts.build
    @new_gamecall = @event.gamecalls.build
    @period1_count = @plays.where(:period1 => true).count
    @period2_count = @plays.where(:period2 => true).count
    @period3_count = @plays.where(:period3 => true).count
    @period4_count = @plays.where(:period4 => true).count
    #respond_with(@event)
  end

  def new
    @event = current_user.events.build
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  #Copies plays from selected install and adds to current install
  def import_plays
    @event = Event.find(params[:id])
    @selected_install = Event.find(params[:ievent])
    @new_plays = @selected_install.plays.collect do |play|
      play.dup
    end
    @new_plays.each do |play|
      play.update(event_id: @event.id)
    end
    Play.transaction do
      @new_plays.each(&:save!)
    end  
    redirect_to @event
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :title, :description, :start_time, :end_time, :event_type, :script_tag, :gamecall_tag)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @event.user != current_user   
    end 

    def subscribed_user
      redirect_to root_path, notice: "Please provide payment" unless current_user_subscribed?
    end    

end
