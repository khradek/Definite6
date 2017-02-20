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
    @plays = @event.plays.includes(:user)
  end

  def summary_1
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @openers_left_remain = 15 - @plays.openers_left.count 
    @openers_right_remain = 15 - @plays.openers_right.count
  end

  def summary_2
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_first_tens_remain = 7 - @plays.run_left_first_tens.count
    @run_right_first_tens_remain = 7 - @plays.run_right_first_tens.count
    @pass_left_first_tens_remain = 7 - @plays.pass_left_first_tens.count
    @pass_right_first_tens_remain = 7 - @plays.pass_right_first_tens.count
  end

  def summary_3
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_second_longs_remain = 5 - @plays.run_left_second_longs.count
    @run_right_second_longs_remain = 5 - @plays.run_right_second_longs.count
    @pass_left_second_longs_remain = 6 - @plays.pass_left_second_longs.count
    @pass_right_second_longs_remain = 6 - @plays.pass_right_second_longs.count
  end

  def summary_4
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_second_mediums_remain = 5 - @plays.run_left_second_mediums.count
    @run_right_second_mediums_remain = 5 - @plays.run_right_second_mediums.count
    @pass_left_second_mediums_remain = 5 - @plays.pass_left_second_mediums.count
    @pass_right_second_mediums_remain = 5 - @plays.pass_right_second_mediums.count
  end

  def summary_5
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_second_shorts_remain = 5 - @plays.run_left_second_shorts.count
    @run_right_second_shorts_remain = 5 - @plays.run_right_second_shorts.count
    @pass_left_second_shorts_remain = 5 - @plays.pass_left_second_shorts.count
    @pass_right_second_shorts_remain = 5 - @plays.pass_right_second_shorts.count
  end

  def summary_6
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_third_longs_remain = 3 - @plays.run_left_third_longs.count
    @run_right_third_longs_remain = 3 - @plays.run_right_third_longs.count
    @pass_left_third_longs_remain = 8 - @plays.pass_left_third_longs.count
    @pass_right_third_longs_remain = 8 - @plays.pass_right_third_longs.count
  end

  def summary_7
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_third_mediums_remain = 5 - @plays.run_left_third_mediums.count
    @run_right_third_mediums_remain = 5 - @plays.run_right_third_mediums.count
    @pass_left_third_mediums_remain = 5 - @plays.pass_left_third_mediums.count
    @pass_right_third_mediums_remain = 5 - @plays.pass_right_third_mediums.count
  end

  def summary_8
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_third_shorts_remain = 7 - @plays.run_left_third_shorts.count
    @run_right_third_shorts_remain = 7 - @plays.run_right_third_shorts.count
    @pass_left_third_shorts_remain = 3 - @plays.pass_left_third_shorts.count
    @pass_right_third_shorts_remain = 3 - @plays.pass_right_third_shorts.count
  end

  def summary_9
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_redzones_remain = 7 - @plays.run_left_redzones.count
    @run_right_redzones_remain = 7 - @plays.run_right_redzones.count
    @pass_left_redzones_remain = 7 - @plays.pass_left_redzones.count
    @pass_right_redzones_remain = 7 - @plays.pass_right_redzones.count
  end

  def summary_10
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_goalines_remain = 7 - @plays.run_left_goalines.count
    @run_right_goalines_remain = 7 - @plays.run_right_goalines.count
    @pass_left_goalines_remain = 7 - @plays.pass_left_goalines.count
    @pass_right_goalines_remain = 7 - @plays.pass_right_goalines.count
  end

  def summary_11
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_coming_outs_remain = 7 - @plays.run_left_coming_outs.count
    @run_right_coming_outs_remain = 7 - @plays.run_right_coming_outs.count
    @pass_left_coming_outs_remain = 7 - @plays.pass_left_coming_outs.count
    @pass_right_coming_outs_remain = 7 - @plays.pass_right_coming_outs.count
  end

  def summary_12
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_custom_ones_remain = 7 - @plays.run_left_custom_ones.count
    @run_right_custom_ones_remain = 7 - @plays.run_right_custom_ones.count
    @pass_left_custom_ones_remain = 7 - @plays.pass_left_custom_ones.count
    @pass_right_custom_ones_remain = 7 - @plays.pass_right_custom_ones.count
  end

  def summary_13
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_custom_twos_remain = 7 - @plays.run_left_custom_twos.count
    @run_right_custom_twos_remain = 7 - @plays.run_right_custom_twos.count
    @pass_left_custom_twos_remain = 7 - @plays.pass_left_custom_twos.count
    @pass_right_custom_twos_remain = 7 - @plays.pass_right_custom_twos.count
  end

  def summary_14
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @run_left_custom_threes_remain = 7 - @plays.run_left_custom_threes.count
    @run_right_custom_threes_remain = 7 - @plays.run_right_custom_threes.count
    @pass_left_custom_threes_remain = 7 - @plays.pass_left_custom_threes.count
    @pass_right_custom_threes_remain = 7 - @plays.pass_right_custom_threes.count
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
