Stripe.api_key = STRIPE_SECRET

class RecordCharges
  def call(event)
    charge = event.data.object

    # Look up the user in our database
    user = User.find_by(stripe_id: charge.customer)

    # Record a charge in our database
    c = user.charges.where(stripe_id: charge.id).first_or_create
    c.update(
      amount: charge.amount,
      card_last4: charge.source.last4,
      card_brand: charge.source.brand,
      card_exp_month: charge.source.exp_month,
      card_exp_year: charge.source.exp_year,
      charge_date: Time.at(charge.created)
    )
  end
end

class SendTrialEndEmail
  def call(event)
    charge = event.data.object
    
    # Look up the user in our database
    user = User.find_by(stripe_id: charge.customer)

    # Send the email
    TrialEndMailer.trial_end(user).deliver_later
  end 
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
  events.subscribe 'customer.subscription.trial_will_end', SendTrialEndEmail.new
end