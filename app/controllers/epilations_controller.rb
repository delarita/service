class EpilationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_epilation, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @epilations = policy_scope(Epilation)
    @epilations_hommes=@epilations.select{ |epil| epil.category == "homme" }
    @epilations_femmes=@epilations.select{ |epil| epil.category == "femme" }
    @order_item = current_order.order_items.new
    @bc_epililation = Epilation.first
    @boncadeau = current_order.order_items.new
  end

  def new
    @epilation = Epilation.new
    authorize @epilation
  end

  def show
  end

  def create
    @epilation = Epilation.new(epilation_params)
    @epilation.user = current_user
    authorize @epilation
    if @epilation.save
      redirect_to epilations_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    @epilation.update(epilation_params)
    redirect_to epilation_path(@epilation)
  end

  def destroy
    @epilation.destroy
    redirect_to epilations_path
  end

  private

  def epilation_params
    params.require(:epilation).permit(:name, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_epilation
    @epilation = Epilation.find(params[:id])
    authorize @epilation
  end

end

