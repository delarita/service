class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :orderitemable, :polymorphic => true
  #belongs_to :epilation

  monetize :unit_price_cents
  monetize :total_price_cents

  before_save :set_unit_price
  before_save :set_total_price

  def unit_price
    if persisted?
      puts "in persisted"
      self[:unit_price_cents]
    else
      puts "in the else #{orderitemable.name} : prix #{orderitemable.price}"
      orderitemable.price * 100
    end
  end

  def total_price
    unit_price * quantity
  end

  private

    def set_unit_price
      puts "in the set"
      self[:unit_price_cents] = unit_price
    end

    def set_total_price
      self[:total_price_cents] = quantity * set_unit_price
    end
end
