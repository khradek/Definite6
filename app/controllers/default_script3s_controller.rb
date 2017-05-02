class DefaultScript3sController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.default_script3.update(default_script3_params)
        format.html { redirect_to @user.default_script3, notice: 'Default Script was successfully updated.' }
        format.json { render :show, status: :created, location: @user.default_script3 }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.default_script3.errors, status: :unprocessable_entity }
        format.js
      end
    end   
  end

  private
    def default_script3_params
      params.require(:default_script3).permit(:user_id, :us_data3, :us_format3, :us_class3, :title, :col_widths)
    end

end