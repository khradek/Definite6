class DefaultScriptsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.default_script.update(default_script_params)
        format.html { redirect_to @user.default_script, notice: 'Default Script was successfully updated.' }
        format.json { render :show, status: :created, location: @user.default_script }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.default_script.errors, status: :unprocessable_entity }
        format.js
      end
    end   
  end

  private
    def default_script_params
      params.require(:default_script).permit(:user_id, :us_data, :us_format, :us_class, :title, :col_widths)
    end

end