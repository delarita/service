class EpilationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_epilation, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index

    @epilations = policy_scope(Epilation).sort_by { |m| [m.created_at] }.reverse!
    @epilations = @epilations.select { |epilation| epilation.name != "BON CADEAU" }
    @bc_epilation = Epilation.find_by(name: "BON CADEAU")

    @epilations_hommes=@epilations.select{ |epil| epil.category == "homme" }
    @epilations_femmes=@epilations.select{ |epil| epil.category == "femme" }

    @order_item = current_order.order_items.new
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
    purge_photo if !params[:epilation][:remove_photo].nil? && params[:epilation][:remove_photo].to_sym == :true
    @epilation.update(epilation_params)
    redirect_to epilation_path(@epilation)
  end

  def destroy
    authorize @epilation
    @epilation.destroy
    redirect_to epilations_path
  end

  def delete_attachment
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_back(fallback_location: epilation_path(@epilation))
  end

  private

  def epilation_params
    params.require(:epilation).permit(:name, :remove_photo, :description, :user_id, :photo, :rich_content, :price_cents)
  end

  def set_epilation
    @epilation = Epilation.find(params[:id])
    authorize @epilation
  end

  def purge_photo
    @epilation.photo.purge
  end
end

