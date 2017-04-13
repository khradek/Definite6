class Events::PracticeSchedulesController < ApplicationController
  before_action :set_practice_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy] 

  respond_to :html

  def print
    @practice_schedule = PracticeSchedule.find(params[:practice_schedule_id]) 
    @event = Event.find(params[:event_id]) 
  end

  def index
    @event = Event.find(params[:event_id])    
    @practice_schedules = PracticeSchedule.all
    respond_with(@practice_schedules)
  end

  def show
    @event = Event.find(params[:event_id])
    @practice_schedules = PracticeSchedule.all
    @plays = @event.plays
    respond_with(@practice_schedule)
  end

  def new
    @event = Event.find(params[:event_id])
    @practice_schedule = current_user.practice_schedules.build
    @plays = @event.plays
    respond_with(@practice_schedule)
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @practice_schedule = PracticeSchedule.new(practice_schedule_params)
    @practice_schedule.user = current_user
    @practice_schedule.event = @event

    respond_to do |format|
      if @practice_schedule.save
        format.html { redirect_to @event, notice: 'Practice Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @practice_schedule }
        format.js  
      else
        format.html { render :new }
        format.json { render json: @practice_schedule.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @practice_schedule.event = @event
    
    respond_to do |format|
      if @practice_schedule.update(practice_schedule_params)
        format.html { redirect_to @event, notice: 'Practice Schedule was successfully updated.' }
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
    @practice_schedule = PracticeSchedule.find(params[:id])

    respond_to do |format|
      if @practice_schedule.destroy
        format.html { redirect_to @event, notice: "The Practice Schedule was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the Practice Schedule." }
        format.js
      end
    end  
  end

  private
    def set_practice_schedule
      @practice_schedule = PracticeSchedule.find(params[:id])
    end

    def practice_schedule_params
      params.require(:practice_schedule).permit(:title, :event_id, :user_id, :start_time, :p_data, :p_format, :p_class)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @practice_schedule.user != current_user   
    end  
end
