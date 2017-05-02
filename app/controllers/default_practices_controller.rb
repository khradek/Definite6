class DefaultPracticesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.default_practice.update(default_practice_params)
        format.html { redirect_to @user.default_practice, notice: 'Default Practice was successfully updated.' }
        format.json { render :show, status: :created, location: @user.default_practice }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.default_practice.errors, status: :unprocessable_entity }
        format.js
      end
    end   
  end

  private
    def default_practice_params
      params.require(:default_practice).permit(:user_id, :up_data, :up_format, :up_class, :col_widths)
    end

end
