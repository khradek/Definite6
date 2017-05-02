class DefaultScript2sController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.default_script2.update(default_script2_params)
        format.html { redirect_to @user.default_script2, notice: 'Default Script was successfully updated.' }
        format.json { render :show, status: :created, location: @user.default_script2 }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.default_script2.errors, status: :unprocessable_entity }
        format.js
      end
    end   
  end

  private
    def default_script2_params
      params.require(:default_script2).permit(:user_id, :us_data2, :us_format2, :us_class2, :title, :col_widths)
    end

end