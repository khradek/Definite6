class TrialEndMailer < ApplicationMailer

  def trial_end(user)
    @user = user
    attachments.inline['Logo.png'] = File.read("app/assets/images/creative/portfolio/Logo.png")
    mail(to: user.email, subject: "Your Definite6.com Trial")
  end

end
