class CartsController < ApplicationController

  def index
      #@order_items = current_order.order_items
      @order_items = policy_scope(OrderItem)
      authorize @order_items
  end

  def show
  end
end
