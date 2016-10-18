class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    if @user.persisted?
      NewUserNotificationMailer.new_user(@user).deliver_later
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
    params.require(:user).permit(:first_name, :last_name, :team, :email, :password, :password_confirmation, :current_password)
  end
  private :account_update_params

end