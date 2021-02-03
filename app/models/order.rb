class Order < ApplicationRecord
  has_many :order_items
  #monetize :total_price_cents
  #monetize :subtotal_price_cents

  before_save :set_subtotal

  def subtotal_price
    puts "--------------------4 - subtotal "

    #calc = Money.new(0,"EUR")
    calc = 0
    # calc = order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
    # p order_items
    # p order_items.length
    order_items.each do |order_item|
      if order_item.valid?
        p "in ---------- if"
        #p order_item.unit_price*order_item.quantity
        p order_item.unit_price
        p "inter 0 ---------- if"
        p order_item.unit_price*order_item.quantity
        p "inter 1 ---------- if"
        p calc
        calc += order_item.unit_price*order_item.quantity
        p "inter 2 ---------- if"
        p calc
        p "out ---------- if"
      else
        #calc += Money.new(0,"EUR")
        calc += 0
      end
    end
    p "calc et Money.new a suivre"
    p calc
    #Money.new(calc, "EUR")
  end

  private
    def set_subtotal
      puts "--------------------3 - set_subtotal "
      self[:subtotal_price_cents] = subtotal_price
    end
end
