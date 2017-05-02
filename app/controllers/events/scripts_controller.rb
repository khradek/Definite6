class Events::ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  respond_to :html

  def print
    @script = Script.find(params[:script_id]) 
    @event = Event.find(params[:event_id]) 
    @plays = @event.plays
  end

  def index
    @event = Event.find(params[:event_id])    
    @scripts = Script.all
    respond_with(@scripts)
  end

  def show
    @event = Event.find(params[:event_id])
    @scripts = Script.all
    @plays = @event.plays
    @pass_plays = @event.plays.where(:play_type => "Pass")
    @run_plays = @event.plays.where(:play_type => "Run")
    respond_with(@script)
  end

  def new
    @event = Event.find(params[:event_id])
    @script = current_user.scripts.build
    @plays = @event.plays
    respond_with(@script)
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @script = Script.new(script_params)
    @script.user = current_user
    @script.event = @event

    respond_to do |format|
      if @script.save
        format.html { redirect_to @event, notice: 'Script was successfully created.' }
        format.json { render :show, status: :created, location: @script }
        format.js  
      else
        format.html { render :new }
        format.json { render json: @script.errors, status: :unprocessable_entity }
        format.js
      end
    end

  end

  def update
    @event = Event.find(params[:event_id])
    @script.event = @event
    
    respond_to do |format|
      if @script.update(script_params)
        format.html { redirect_to @event, notice: 'Script was successfully updated.' }
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
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.destroy
        format.html { redirect_to @event, notice: "The script was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the script." }
        format.js
      end
    end  
  end

  private
    def set_script
      @script = Script.find(params[:id])
    end

    def script_params
      params.require(:script).permit(:title, :sdata, :event_id, :user_id, :start_time, :end_time, :bad_format_date, :s_format, :s_class, :script_template, :col_widths, :orig_col_widths)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @script.user != current_user   
    end 
end
