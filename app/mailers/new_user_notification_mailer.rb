class NewUserNotificationMailer < ApplicationMailer

  def new_user(user)
    @user = user
    mail(to: "kevin@definite6.com", subject: "A New User Has Signed-Up") 
  end

end
