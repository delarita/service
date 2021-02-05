class OrderItemsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!, only: [ :create, :update, :destroy]
  before_action :load_orderitemable
  skip_after_action :verify_authorized

    def create

    #puts "here"
    #p @orderitemable
    #p "12"
    #p current_order
    @order = current_order
    #p "6"
    #p @order
    @order_item = @order.order_items.new(order_item_params)
    puts "new order item"
    p @order_item
    #p params
    #prod = OrderItem.where("orderitemable_type = ? AND orderitemable_id = ?", params[:order_item][:orderitemable_type], params[:order_item][:orderitemable_id].to_i)
    # p prod
    #p "13"

    #_____________________
    #authorize @order
    #authorize @order_item
    #---------------------

    #p "14"
    #binding.pry
    @order.save
    #puts "save"
    session[:order_id] = @order.id
  end

  def update
    puts "on passe par le update controller"
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = @order.order_items
    redirect_to carts_path
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
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
