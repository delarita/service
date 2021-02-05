class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index]
  skip_after_action :verify_policy_scoped

  def index
      @orderitemables = []

      if current_user.nil?
        @order_items = OrderItem.where(order_id: current_order)
      else
        # a modifier
        @order_items = OrderItem.where(order_id: current_order)
      end

      #@order_items = policy_scope(OrderItem)
      @order_items = @order_items.sort_by &:created_at
      @order_items.each do |order_item|
        orderitemable = order_item.orderitemable_type.constantize.find(order_item.orderitemable_id)
        @orderitemables << orderitemable
      end

      @carts = @order_items.zip(@orderitemables)

  end



end
