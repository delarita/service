class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :send_confirm_mail, only: [:show]
  def show
    puts "entree dans le controller OrdersController"
  end

  private
  def set_order
    @order = Order.find(params[:id])
    p @order
    authorize @order
  end

  def send_confirm_mail
    UserMailer.with(user: current_or_guest_user).voucher.deliver_now
  end
end
