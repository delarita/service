class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]
  skip_after_action :verify_policy_scoped

  def index

    # puts "Tout doit etre remis en ligne"
    @orders = current_or_guest_user.orders.where(state: 'pending')

    @orders.each do |order|
      p order.subtotal_price_cents
      if order.subtotal_price_cents != 0
        stripe_session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: current_or_guest_user.email,
            amount: order.subtotal_price_cents,
            currency: 'eur',
            quantity: 1
          }],
          success_url: order_url(order),
          cancel_url: carts_url
        )
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        p stripe_session
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        order.update(checkout_session_id: stripe_session.id)
      end
    end
  end
end
