class MassagesController < ApplicationController
  before_action :set_massage, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @massages = Massage.all
  end

  def new
    @massage = Massage.new
  end

  def show
    #@massage = Massage.find(params[:id])
  end

  def create
    @massage = Massage.new(massage_params)
    @massage.user = current_user
    if @massage.save
      redirect_to massages_path
    else
      render :new
    end
  end

  def edit
    #@massage = Massage.find(params[:id])
  end

  def update
    #@massage = Massage.find(params[:id])
    @massage.update(massage_params)
    redirect_to massages_path
  end

  def destroy
    #@massage = Massage.find(params[:id])
    @massage.destroy
    #redirect_to reviews_path
  end

  private

  def massage_params
    params.require(:massage).permit(:name, :description, :photo, :rich_content)
  end

  def set_massage
    @massage = Massage.find(params[:id])
  end

end

