class SoinvisagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_soinvisage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    #@soinvisages = Soinvisage.all
    @soinvisages = policy_scope(Soinvisage)
  end

  def new
    @soinvisage = Soinvisage.new
    authorize @soinvisage
  end

  def show
    #@soinvisage = Soinvisage.find(params[:id])
    #authorize @soinvisage
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
    #@soinvisage = Soinvisage.find(params[:id])
  end

  def update
    #@soinvisage = Soinvisage.find(params[:id])
    #authorize @soinvisage
    @soinvisage.update(soinvisage_params)
    redirect_to soinvisages_path
  end

  def destroy
    #@soinvisage = Soinvisage.find(params[:id])
    #authorize @soinvisage
    @soinvisage.destroy
    redirect_to soinvisages_path
  end

  private

  def soinvisage_params
    params.require(:soinvisage).permit(:name, :description, :photo, :rich_content)
  end

  def set_soinvisage
    @soinvisage = Soinvisage.find(params[:id])
    authorize @soinvisage
  end

end

