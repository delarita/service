class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  include Pundit
  include ApplicationHelper

  before_action :set_counter

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
    #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    #def user_not_authorized
    #  flash[:alert] = "You are not authorized to perform this action."
    #  redirect_to(root_path)
    #end


  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Exception, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  # def raise_not_found
  #   raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  # end

  # def not_found
  #   respond_to do |format|
  #     format.html { render file: Rails.root.join('public', '404.html'), layout: false, status: :not_found }
  #     format.xml { head :not_found }
  #     format.any { head :not_found }
  #   end
  # end

  # def error
  #   respond_to do |format|
  #     format.html { render file: Rails.root.join('public', '500.html'), layout: false, status: :error }
  #     format.xml { head :not_found }
  #     format.any { head :not_found }
  #   end
  # end

  private

  def set_counter
    @cart_count = current_order.order_items.size
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end


end
