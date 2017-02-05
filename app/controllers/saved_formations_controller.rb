class SavedFormationsController < ApplicationController
  before_action :set_saved_formation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @saved_formations = SavedFormation.where(:user_id => current_user.id).order(:priority => :asc, :created_at => :asc) 
    @saved_formation = current_user.saved_formations.build
    respond_with(@saved_formations)
  end

  def show
    respond_with(@saved_formation)
  end

  def new
    @saved_formation = current_user.saved_formations.build
    respond_with(@saved_formation)
  end

  def edit
  end

  def create
    @saved_formation = SavedFormation.new(saved_formation_params)
    @saved_formation.user = current_user
    @saved_formation.save

    respond_to do |format|
      if @saved_formation.save
        format.html { redirect_to @saved_formation, notice: 'The formation was successfully created.' }
        format.json { render :show, status: :created, location: @saved_formation }
        format.js
      else
        format.html { render :new }
        format.json { render json: @saved_formation.errors, status: :unprocessable_entity }
        format.js
      end
    end

  end

  def update
    @saved_formation.update(saved_formation_params)

    respond_to do |format|
      if @saved_formation.update(saved_formation_params)
        format.html { redirect_to saved_formations_path, info: 'The formation was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_formation }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @saved_formation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @saved_formation = SavedFormation.find(params[:id])

    respond_to do |format|
      if @saved_formation.destroy
        format.html { redirect_to @saved_formation, info: "The formation was deleted successfully." }
        format.js
      else
        format.html { render :show, flash[:error] = "There was an error deleting the formation." }
        format.js
      end
    end 
  end

  def sort
    params[:order].each do |key,value|
      SavedFormation.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    def set_saved_formation
      @saved_formation = SavedFormation.find(params[:id])
    end

    def saved_formation_params
      params.require(:saved_formation).permit(:title, :user_id, :priority)
    end

    def correct_user
      redirect_to root_path, notice: "Not authorized" if @saved_formation.user != current_user   
    end 
end
