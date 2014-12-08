class ChargesController < ApplicationController

  def create
    stripe_token = params[:stripeToken]
    email = params[:stripeEmail]


    # create a stripe charge
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
    @charge = Stripe::Charge.create(:amount => 2000,
                          :currency => "usd",
                          :card => stripe_token, # obtained with Stripe.js
                          :description => "Charge for #{email}")


    # show a receipt
  end

end
