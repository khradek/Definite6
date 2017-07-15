class TrialEndMailer < ApplicationMailer

  def trial_end(user)
    @user = user
    mail(to: user.email, subject: "Your Definite6.com Trial") 
  end

end
