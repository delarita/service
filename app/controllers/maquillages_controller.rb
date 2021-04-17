class MaquillagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_maquillage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @maquillages = policy_scope(Maquillage).sort_by { |m| [m.created_at] }.reverse!
    @maquillages = @maquillages.select { |maquillage| maquillage.name != "BON CADEAU" }
    @bc_maquillage = Maquillage.find_by(name: "BON CADEAU")
    @order_item = current_order.order_items.new
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
    purge_photo if !params[:maquillage][:remove_photo].nil? && params[:maquillage][:remove_photo].to_sym == :true
    @maquillage.update(maquillage_params)
    redirect_to maquillage_path(@maquillage)
  end

  def destroy
    authorize @maquillage
    @maquillage.destroy
    redirect_to maquillages_path
  end

  def delete_attachment
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back(fallback_location: maquillage_path(@maquillage))
  end

  private

  def maquillage_params
    params.require(:maquillage).permit(:name, :remove_photo, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_maquillage
    @maquillage = Maquillage.find(params[:id])
    authorize @maquillage
  end

  def purge_photo
    @soinvisage.photo.purge
  end
end

