class MassagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_massage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @massages = policy_scope(Massage).sort_by { |m| [m.updated_at] }.reverse!
    @order_item = current_order.order_items.new
    @bc_massage = Massage.first
    @boncadeau = current_order.order_items.new
  end

  def new
    @massage = Massage.new
    authorize @massage
  end

  def show
  end

  def create
    @massage = Massage.new(massage_params)
    @massage.user = current_user
    authorize @massage
    if @massage.save
      redirect_to massages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @massage.update(massage_params)
    redirect_to massages_path
  end

  def destroy
    @massage.destroy
    redirect_to massages_path
  end

  private

  def massage_params
    params.require(:massage).permit(:name, :description, :photo, :rich_content, :price_cents)
  end

  def set_massage
    @massage = Massage.find(params[:id])
    authorize @massage
  end

end

