class MaquillagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_maquillage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @maquillages = policy_scope(Maquillage).sort_by { |m| [m.updated_at] }.reverse!
    @order_item = current_order.order_items.new
    @bc_maquillage = Maquillage.first
    @boncadeau = current_order.order_items.new
  end

  def new
    @maquillage = Maquillage.new
    authorize @maquillage
  end

  def show
  end

  def create
    @maquillage = Maquillage.new(maquillage_params)
    @maquillage.user = current_user
    authorize @maquillage
    if @maquillage.save
      redirect_to maquillages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @maquillage.update(maquillage_params)
    redirect_to maquillage_path(@maquillage)
  end

  def destroy
    authorize @maquillage
    @maquillage.destroy
    redirect_to maquillages_path
  end

  private

  def maquillage_params
    params.require(:maquillage).permit(:name, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_maquillage
    @maquillage = Maquillage.find(params[:id])
    authorize @maquillage
  end

end

