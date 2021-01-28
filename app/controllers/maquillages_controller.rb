class MaquillagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_maquillage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    #@maquillages = Maquillage.all
    @maquillages = policy_scope(Maquillage)
  end

  def new
    @maquillage = Maquillage.new
    authorize @maquillage
  end

  def show
    #@maquillage = Maquillage.find(params[:id])
    #authorize @maquillage
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
    #@maquillage = Maquillage.find(params[:id])
    #authorize @maquillage
  end

  def update
    #@maquillage = Maquillage.find(params[:id])
    #authorize @maquillage
    @maquillage.update(maquillage_params)
    redirect_to maquillage_path(@maquillage)
  end

  def destroy
    #@maquillage = Maquillage.find(params[:id])
    authorize @maquillage
    @maquillage.destroy
    redirect_to maquillages_path
  end

  private

  def maquillage_params
    params.require(:maquillage).permit(:name, :description, :user_id, :photo, :rich_content)
  end

  def set_maquillage
    @maquillage = Maquillage.find(params[:id])
    authorize @maquillage
  end

end

