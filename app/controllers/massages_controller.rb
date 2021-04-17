class MassagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_massage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @massages = policy_scope(Massage).sort_by { |m| [m.created_at] }.reverse!
    @massages = @massages.select { |massage| massage.name != "BON CADEAU" }
    @bc_massage = Massage.find_by(name: "BON CADEAU")
    @order_item = current_order.order_items.new
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
    purge_photo if !params[:massage][:remove_photo].nil? && params[:massage][:remove_photo].to_sym == :true
    @massage.update(massage_params)
    redirect_to massage_path(@massage)
  end

  def destroy
    authorize @massage
    @massage.destroy
    redirect_to massages_path
  end

  def delete_attachment
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back(fallback_location: massage_path(@massage))
  end

  private

  def massage_params
    params.require(:massage).permit(:name, :remove_photo, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_massage
    @massage = Massage.find(params[:id])
    authorize @massage
  end

  def purge_photo
    @massage.photo.purge
  end
end

