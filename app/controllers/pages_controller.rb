class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @epil = Epilation.first
    @boncadeau = current_order.order_items.new
    @order_item = @boncadeau
  end

  def about
  end

end
