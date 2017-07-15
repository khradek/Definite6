# Preview all emails at http://localhost:3000/rails/mailers/trial_end_mailer
class TrialEndMailerPreview < ActionMailer::Preview

  def trial_end

    user = User.first
    mail(to: user.email, subject: "Your Definite6.com Trial") 
  end

end
