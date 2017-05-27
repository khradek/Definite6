class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :subscribed_user

  respond_to :html, :js, :json

  def print
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
    @play_count = @plays.count
  end

  def quick_assign
    @event = Event.find(params[:event_id])
    @plays = @event.plays
  end

  def summary_1
    @event = Event.find(params[:event_id])
    @plays = @event.plays
    @openers_left_remain = 15 - @plays.openers_left.count 
    @openers_right_remain = 15 - @plays.openers_right.count
  end

  def summary_2
    @event = Event.find(params[:event_id])
    @plays = @event.plays.first_tens
    @num_runs = if current_user.s_name2_num_run == 14
                  15
                else
                  current_user.s_name2_num_run
                end
    @run_lefts = @plays.run_left_first_tens.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_first_tens.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_first_tens.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_first_tens.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_3
    @event = Event.find(params[:event_id])
    @plays = @event.plays.second_longs
    @num_runs = if current_user.s_name3_num_run == 11
                  12
                else
                  current_user.s_name3_num_run
                end
    @run_lefts = @plays.run_left_second_longs.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_second_longs.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 12
                    0
                  elsif @num_runs == 0
                    12  
                  else    
                    11 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_second_longs.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_second_longs.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_4
    @event = Event.find(params[:event_id])
    @plays = @event.plays.second_mediums
    @num_runs = if current_user.s_name4_num_run == 10
                  11
                else
                  current_user.s_name4_num_run
                end
    @run_lefts = @plays.run_left_second_mediums.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_second_mediums.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 11
                    0
                  elsif @num_runs == 0
                    11  
                  else    
                    10 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_second_mediums.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_second_mediums.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_5
    @event = Event.find(params[:event_id])
    @plays = @event.plays.second_shorts
    @num_runs = if current_user.s_name5_num_run == 10
                  11
                else
                  current_user.s_name5_num_run
                end
    @run_lefts = @plays.run_left_second_shorts.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_second_shorts.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 11
                    0
                  elsif @num_runs == 0
                    11  
                  else    
                    10 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_second_shorts.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_second_shorts.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_6
    @event = Event.find(params[:event_id])
    @plays = @event.plays.third_longs
    @num_runs = if current_user.s_name6_num_run == 11
                  12
                else
                  current_user.s_name6_num_run
                end
    @run_lefts = @plays.run_left_third_longs.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_third_longs.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 12
                    0
                  elsif @num_runs == 0
                    12  
                  else    
                    11 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_third_longs.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_third_longs.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_7
    @event = Event.find(params[:event_id])
    @plays = @event.plays.third_mediums
    @num_runs = if current_user.s_name7_num_run == 10
                  11
                else
                  current_user.s_name7_num_run
                end
    @run_lefts = @plays.run_left_third_mediums.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_third_mediums.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 11
                    0
                  elsif @num_runs == 0
                    11  
                  else    
                    10 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_third_mediums.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_third_mediums.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_8
    @event = Event.find(params[:event_id])
    @plays = @event.plays.third_shorts 
    @num_runs = if current_user.s_name8_num_run == 10
                  11
                else
                  current_user.s_name8_num_run
                end
    @run_lefts = @plays.run_left_third_shorts.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_third_shorts.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 11
                    0
                  elsif @num_runs == 0
                    11  
                  else    
                    10 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_third_shorts.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_third_shorts.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_9
    @event = Event.find(params[:event_id])
    @plays = @event.plays.redzones 
    @num_runs = if current_user.s_name9_num_run == 14
                  15
                else
                  current_user.s_name9_num_run
                end
    @run_lefts = @plays.run_left_redzones.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_redzones.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_redzones.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_redzones.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_10
    @event = Event.find(params[:event_id])
    @plays = @event.plays.goalines
    @num_runs = if current_user.s_name10_num_run == 14
                  15
                else
                  current_user.s_name10_num_run
                end
    @run_lefts = @plays.run_left_goalines.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_goalines.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_goalines.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_goalines.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_11
    @event = Event.find(params[:event_id])
    @plays = @event.plays.coming_outs
    @num_runs = if current_user.s_name11_num_run == 14
                  15
                else
                  current_user.s_name11_num_run
                end
    @run_lefts = @plays.run_left_coming_outs.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_coming_outs.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_coming_outs.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_coming_outs.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_12
    @event = Event.find(params[:event_id])
    @plays = @event.plays.custom_ones 
    @num_runs = if current_user.s_name12_num_run == 14
                  15
                else
                  current_user.s_name12_num_run
                end
    @run_lefts = @plays.run_left_custom_ones.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_custom_ones.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_custom_ones.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_custom_ones.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_13
    @event = Event.find(params[:event_id])
    @plays = @event.plays.custom_twos
    @num_runs = if current_user.s_name13_num_run == 14
                  15
                else
                  current_user.s_name13_num_run
                end
    @run_lefts = @plays.run_left_custom_twos.limit(@num_runs)
    @run_lefts_remain = @num_runs - @run_lefts.count
    @run_rights = @plays.run_right_custom_twos.limit(@num_runs)
    @run_rights_remain = @num_runs - @run_rights.count
    @num_passes = if @num_runs == 15
                    0
                  elsif @num_runs == 0
                    15  
                  else    
                    14 - @num_runs 
                  end  
    @pass_lefts = @plays.pass_left_custom_twos.limit(@num_passes)
    @pass_lefts_remain = @num_passes - @pass_lefts.count
    @pass_rights = @plays.pass_right_custom_twos.limit(@num_passes)
    @pass_rights_remain = @num_passes - @pass_rights.count
  end

  def summary_14
    @event = Event.find(params[:event_id])
    @plays = @event.plays.custom_threes 
    @custom_three_lefts_remain = 15 - @plays.custom_three_lefts.count
    @custom_three_rights_remain = 15 - @plays.custom_three_rights.count
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
    @practice_schedules = @event.practice_schedules.order(:start_time => :asc)      
    @gamecall_count = @event.gamecalls.count
    @plays = @event.plays.order(:priority => :asc, :created_at => :asc)
    @new_play = @event.plays.build
    @new_script = @event.scripts.build
    @new_gamecall = @event.gamecalls.build
    @new_practice_schedule = @event.practice_schedules.build
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
