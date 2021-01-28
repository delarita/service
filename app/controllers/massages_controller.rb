class MassagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_massage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    #@massages = Massage.all
    @massages = policy_scope(Massage)
  end

  def new
    @massage = Massage.new
    authorize @massage
  end

  def show
    #@massage = Massage.find(params[:id])
    authorize @massage
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
    #@massage = Massage.find(params[:id])
    authorize @massage
  end

  def update
    #@massage = Massage.find(params[:id])
    authorize @massage
    @massage.update(massage_params)
    redirect_to massages_path
  end

  def destroy
    #@massage = Massage.find(params[:id])
    authorize @massage
    @massage.destroy
    redirect_to massages_path
  end

  private

  def massage_params
    params.require(:massage).permit(:name, :description, :photo, :rich_content, :price_cents)
  end

  def set_massage
    @massage = Massage.find(params[:id])
  end

end

