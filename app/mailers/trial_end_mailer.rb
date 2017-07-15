class TrialEndMailer < ApplicationMailer

  def trial_end(user)
    @user = user
    mail(to: "kevin@definite6.com", subject: "Your Definite6.com Trial") 
    #mail(to: user.email, subject: "Your Definite6.com Trial")
  end

end
