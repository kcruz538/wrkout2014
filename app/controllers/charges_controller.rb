class ChargesController < ApplicationController

  def cart
    # add item to cart
    album = Album.find params[:album_id]

    number_already_in_cart = session[:cart][album.id.to_s].to_i
    session[:cart][album.id.to_s] = number_already_in_cart + 1
  end

  def show
    @charge = Charge.find_by stripe_charge_id: params[:id]
    redirect_to root_path, notice: "Sucessfully Subcribed"
  end

  def create
    stripe_token = params[:stripeToken]
    email = params[:stripeEmail]


    # create a stripe charge
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
    @charge = Stripe::Charge.create(:amount => 2000,
                          :currency => "usd",
                          :card => stripe_token, # obtained with Stripe.js
                          :description => "Charge for #{email}")

    our_charge = Charge.create amount_in_cents: 2000,
                  email: email,
                  description: "Charge for #{email}",
                  stripe_charge_id: @charge.id

    # show a receipt

    redirect_to charge_path(id: @charge.id)

  end

end
