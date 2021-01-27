class EpilationsController < ApplicationController
  before_action :set_epilation, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @epilations = Epilation.all
  end

  def new
    @epilation = Epilation.new
  end

  def show
    #@epilation = Epilation.find(params[:id])
  end

  def create
    @epilation = Epilation.new(epilation_params)
    if @epilation.save
      redirect_to epilations_path
    else
      render :new
    end
  end

  def edit
    #@epilation = Epilation.find(params[:id])
  end

  def update
    #@epilation = Epilation.find(params[:id])
    @epilation.update(epilation_params)
    redirect_to epilation_path(@epilation)
  end

  def destroy
    #@epilation = Epilation.find(params[:id])
    @epilation.destroy
    #redirect_to reviews_path
  end

  private

  def epilation_params
    params.require(:epilation).permit(:name, :description, :photo, :rich_content)
  end

  def set_epilation
    @epilation = Epilation.find(params[:id])
  end

end

