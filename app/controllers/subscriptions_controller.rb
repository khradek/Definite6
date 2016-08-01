class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]

  def show
  end

  def new
  end

  def create
    customer = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
               else
                 Stripe::Customer.create(email: current_user.email)
               end

    if current_user.stripe_id?
      subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: "annual_no_trial"
    )
    else
      subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: "annual"
      )
    end

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
      subscription_end: Time.at(subscription.current_period_end),
      cancelled: false,
    }

    # Only update the card on file if we're adding a new one
    options.merge!(
      card_last4: params[:card_last4],
      card_exp_month: params[:card_exp_month],
      card_exp_year: params[:card_exp_year],
      card_brand: params[:card_brand]
    ) if params[:card_last4]

    current_user.update(options)

    redirect_to events_path    
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(cancelled: true)

    redirect_to root_path, notice: "Your account has been deactivated"
  end

  private

    def redirect_to_signup
      if !user_signed_in?
        session["user_return_to"] = new_subscription_path
        redirect_to new_user_registration_path
      end
    end

end
