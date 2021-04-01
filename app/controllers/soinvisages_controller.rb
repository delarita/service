class SoinvisagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_soinvisage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @soinvisages = policy_scope(Soinvisage).sort_by { |m| [m.updated_at] }.reverse!
    @order_item = current_order.order_items.new
    @bc_soinvisage = Soinvisage.first
    @boncadeau = current_order.order_items.new
  end

  def new
    @soinvisage = Soinvisage.new
    authorize @soinvisage
  end

  def show
  end

  def create
    @soinvisage = Soinvisage.new(soinvisage_params)
    @soinvisage.user = current_user
    authorize @soinvisage
    if @soinvisage.save
      redirect_to soinvisages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @soinvisage.update(soinvisage_params)
    redirect_to soinvisages_path
  end

  def destroy
    @soinvisage.destroy
    redirect_to soinvisages_path
  end

  private

  def soinvisage_params
    params.require(:soinvisage).permit(:name, :description, :photo, :rich_content, :price_cents)
  end

  def set_soinvisage
    @soinvisage = Soinvisage.find(params[:id])
    authorize @soinvisage
  end

end

