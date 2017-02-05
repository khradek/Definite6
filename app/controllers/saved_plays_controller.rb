class SavedPlaysController < ApplicationController
  before_action :set_saved_play, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @saved_plays = SavedPlay.where(:user_id => current_user.id).order(:priority => :asc, :created_at => :asc)
    @saved_play = current_user.saved_plays.build
    respond_with(@saved_plays)
  end

  def show
    respond_with(@saved_play)
  end

  def new
    @saved_play = current_user.saved_plays.build
    respond_with(@saved_play)
  end

  def edit
  end

  def create
    @saved_play = SavedPlay.new(saved_play_params)
    @saved_play.user = current_user
    @saved_play.save

    respond_to do |format|
      if @saved_play.save
        format.html { redirect_to @saved_play, notice: 'The play was successfully created.' }
        format.json { render :show, status: :created, location: @saved_play }
        format.js
      else
        format.html { render :new }
        format.json { render json: @saved_play.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @saved_play.update(saved_play_params)

    respond_to do |format|
      if @saved_play.update(saved_play_params)
        format.html { redirect_to saved_plays_path, info: 'The play was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_play }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @saved_play.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @saved_play.destroy

    respond_to do |format|
      if @saved_play.destroy
        format.html { redirect_to @saved_play, info: "The play was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the play." }
        format.js
      end
    end 
  end

  def sort
    params[:order].each do |key,value|
      SavedPlay.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    def set_saved_play
      @saved_play = SavedPlay.find(params[:id])
    end

    def saved_play_params
      params.require(:saved_play).permit(:title, :user_id, :priority)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @saved_play.user != current_user   
    end 
end
