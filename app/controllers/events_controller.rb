class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js, :json

  def index
    @events = Event.where(:user_id => current_user.id)    
    @ievents = Event.where(:event_type => "Install").where(:user_id => current_user.id).order(:start_time => :desc)
    @event = current_user.events.build
    respond_with(@events)
  end

  def show
    @event = Event.find(params[:id])
    @scripts = @event.scripts.order(:end_time => :asc)  
    @plays = @event.plays
    @new_play = @event.plays.build
    @new_script = @event.scripts.build
    @period1_count = @event.plays.where(:period1 => true).count
    gon.watch.period1_count = @period1_count
    @period2_count = @event.plays.where(:period2 => true).count
    gon.watch.period2_count = @period2_count
    @period3_count = @event.plays.where(:period3 => true).count
    gon.watch.period3_count = @period3_count
    @period4_count = @event.plays.where(:period4 => true).count
    gon.watch.period4_count = @period4_count
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

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :title, :description, :start_time, :end_time, :event_type, :script_tag)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @event.user != current_user   
    end 
end
