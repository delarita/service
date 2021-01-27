class SoinvisagesController < ApplicationController
  before_action :set_soinvisage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @soinvisages = Soinvisage.all
  end

  def new
    @soinvisage = Soinvisage.new
  end

  def show
    #@soinvisage = Soinvisage.find(params[:id])
  end

  def create
    @soinvisage = Soinvisage.new(soinvisage_params)
    @soinvisage.user = current_user
    if @soinvisage.save
      redirect_to soinvisages_path
    else
      render :new
    end
  end

  def edit
    #@soinvisage = Soinvisage.find(params[:id])
  end

  def update
    #@soinvisage = Soinvisage.find(params[:id])
    @soinvisage.update(soinvisage_params)
    redirect_to soinvisages_path
  end

  def destroy
    #@soinvisage = Soinvisage.find(params[:id])
    @soinvisage.destroy
    #redirect_to reviews_path
  end

  private

  def soinvisage_params
    params.require(:soinvisage).permit(:name, :description, :photo, :rich_content)
  end

  def set_soinvisage
    @soinvisage = Soinvisage.find(params[:id])
  end

end

