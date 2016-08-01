module SubscriptionsHelper

  def trial_end
     Time.now + 30.days
  end

  def subscription_end
    Time.now + 365.days
  end

end