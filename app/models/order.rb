class Order < ApplicationRecord
  has_many :order_items

  belongs_to :user
  #monetize :total_price_cents
  #monetize :subtotal_price_cents

  before_save :set_subtotal

  def subtotal_price
    calc = 0
    order_items.each do |order_item|
      if order_item.valid?
        calc += order_item.unit_price*order_item.quantity
      else
        calc += 0
      end
    end
    calc
  end

  private
    def set_subtotal
      puts "--------------------3 - set_subtotal "
      self[:subtotal_price_cents] = subtotal_price
    end
end
