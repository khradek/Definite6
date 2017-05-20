class DefaultGamecallsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.default_gamecall.update(default_gamecall_params)
        format.html { redirect_to @user.default_gamecall, notice: 'Gamecall template was successfully updated.' }
        format.json { render :show, status: :created, location: @user.default_gamecall }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.default_gamecall.errors, status: :unprocessable_entity }
        format.js
      end
    end   
  end

  private
    def default_gamecall_params
      params.require(:default_gamecall).permit(:user_id, :gc_data1, :gc_format1, :gc_class1, :col_widths1, :gc_data2, :gc_format2, :gc_class2, :col_widths2)
    end

end