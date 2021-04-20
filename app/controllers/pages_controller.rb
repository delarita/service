class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :legal ]
  require 'open-uri'
  require 'nokogiri'

  def home
    @epil = Epilation.first
    @boncadeau = current_order.order_items.new
    @order_item = @boncadeau

    # scrapping the reviews
    url = "https://relook-esthetique.business.site/"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)  
    @reviews = html_doc.search('.Sc4eWe')
    @reviews_names = html_doc.search('.YSOJuc')
    
    
  end

 

  def about
  end

  def legal
  end

end
