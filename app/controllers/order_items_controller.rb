class OrderItemsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!, only: [ :create, :update, :destroy]
  before_action :load_orderitemable
  skip_after_action :verify_authorized

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.user = current_or_guest_user
    @order.save
    session[:order_id] = @order.id
  end

  def update
    puts "on passe par le update controller"
    @order = current_order
    begin
      @order_item = @order.order_items.find(params[:id])
      @order_item.update(order_item_params)
    rescue
      @order_item = OrderItem.find(params[:id])
      @order_item.update(order_item_params)
    end
    @order_items = @order.order_items
    redirect_to carts_path
  end

  def destroy
    puts "on passe par le destroy controller"
    @order = current_order
    begin
      @order_item = @order.order_items.find(params[:id])
      @order_item.destroy
    rescue
      @order_item = OrderItem.find(params[:id])
      @order_item.destroy
    end
    puts "on continue dans le destroy controller"
    @order_items = @order.order_items
    redirect_to carts_path
  end

  private
    def order_item_params
      params.require(:order_item).permit(:orderitemable_type, :orderitemable_id, :quantity)
    end

  private

  def load_orderitemable
    resource, id = request.path.split('/')[1,2]
    @orderitemable = resource.singularize.classify.constantize.find(id)
  end
end
