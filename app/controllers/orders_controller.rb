class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def show
    puts "entree dans le controller OrdersController"
  end

  private
  def set_order
    @order = Order.find(params[:id])
    p @order
    authorize @order
    #@order = current_user.orders.find(params[:id])

    #authorize @order
  end
end
