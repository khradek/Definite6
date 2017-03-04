class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    #Sends email to me when new user is created - change to deliver_later when worker dyno is active
    if @user.persisted?
      NewUserNotificationMailer.new_user(@user).deliver_now
    end
  end

  def after_sign_up_path_for(resource)
    new_subscription_path
  end
  protected :after_sign_up_path_for

  #New
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password(params)
    else
     super
    end
  end
  protected :update_resource

  def after_update_path_for(resource)
    edit_user_registration_path
  end
  protected :after_update_path_for

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :team, :email, :password, :password_confirmation)
  end
  private :sign_up_params

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :team, :email, :password, :password_confirmation, :current_password, :s_name1, :s_name2, :s_name3, :s_name4, :s_name5, :s_name6, :s_name7, :s_name8, :s_name9, :s_name10, :s_name11, :s_name12, :s_name13, :s_name14, :s_name2_num_run, :s_name3_num_run, :s_name4_num_run, :s_name5_num_run, :s_name6_num_run, :s_name7_num_run, :s_name8_num_run, :s_name9_num_run, :s_name10_num_run, :s_name11_num_run, :s_name12_num_run, :s_name13_num_run, :s_name14_num_run, :sit1_color, :sit2_color, :sit3_color, :sit4_color, :sit5_color, :sit6_color, :sit7_color, :sit8_color, :sit9_color, :sit10_color, :sit11_color, :sit12_color, :sit13_color, :sit14_color )
  end
  private :account_update_params

end