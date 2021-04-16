class SoinvisagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_soinvisage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @soinvisages = policy_scope(Soinvisage).sort_by { |m| [m.created_at] }.reverse!
    @soinvisages = @soinvisages.select { |soinvisage| soinvisage.name != "BON CADEAU" }
    @bc_soinvisage = Soinvisage.find_by(name: "BON CADEAU")
    @order_item = current_order.order_items.new
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
    purge_photo if !params[:soinvisage][:remove_photo].nil? && params[:soinvisage][:remove_photo].to_sym == :true
    @soinvisage.update(soinvisage_params)
    redirect_to soinvisage_path(@soinvisage)
  end

  def destroy
    authorize @soinvisage
    @soinvisage.destroy
    redirect_to soinvisages_path
  end

  def delete_attachment
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back(fallback_location: soinvisage_path(@soinvisage))
  end

  private

  def soinvisage_params
    params.require(:soinvisage).permit(:name, :remove_photo, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_soinvisage
    @soinvisage = Soinvisage.find(params[:id])
    authorize @soinvisage
  end

  def purge_photo
    @soinvisage.photo.purge
  end
end

