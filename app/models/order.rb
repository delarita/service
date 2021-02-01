class Order < ApplicationRecord
  has_many :order_items
  monetize :total_price_cents
  monetize :subtotal_price_cents


  before_save :set_subtotal

  def subtotal_price
    puts "in subtotal_price calcul"
    puts "#{order_items} #{order_items.length}"
    order_items.each do |order_item|
      puts "quantity: #{order_item.quantity}"
    end
    order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price*order_item.quantity) : 0}.sum
  end

  private
    def set_subtotal
      self[:subtotal_price_cents] = subtotal_price
    end
end
