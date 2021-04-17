class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :send_confirm_mail, only: [:show]
  after_action :reset_session, only: [:show]

  def index
    # @orders = policy_scope(Order).sort_by &:updated_at
    @orders = policy_scope(Order).sort_by { |m| [m.updated_at] }.reverse!
  end

  def show
    puts "entree dans le controller OrdersController"
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private
  def set_order
    @order = Order.find(params[:id])
    p @order
    authorize @order
  end

  def send_confirm_mail
    p @order
    if (!@order.email_sent) && (@order.state == 'paid')
      UserMailer.with(user: current_or_guest_user).voucher(@order).deliver_now
      @order.email_sent = true
      @order.save!
    end
  end

  def reset_session
    session[:order_id] = nil
  end
end
