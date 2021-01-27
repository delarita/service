class MaquillagesController < ApplicationController
  before_action :set_maquillage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @maquillages = Maquillage.all
  end

  def new
    @maquillage = Maquillage.new
  end

  def show
    #@maquillage = Maquillage.find(params[:id])
  end

  def create
    @maquillage = Maquillage.new(maquillage_params)
    @maquillage.user = current_user
    if @maquillage.save
      redirect_to maquillages_path
    else
      render :new
    end
  end

  def edit
    #@maquillage = Maquillage.find(params[:id])
  end

  def update
    #@maquillage = Maquillage.find(params[:id])
    @maquillage.update(maquillage_params)
    redirect_to maquillages_path
  end

  def destroy
    #@maquillage = Maquillage.find(params[:id])
    @maquillage.destroy
    #redirect_to reviews_path
  end

  private

  def maquillage_params
    params.require(:maquillage).permit(:name, :description, :photo, :rich_content)
  end

  def set_maquillage
    @maquillage = Maquillage.find(params[:id])
  end

end

