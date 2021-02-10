class PaymentsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
