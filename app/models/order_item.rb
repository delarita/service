class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :orderitemable, :polymorphic => true

  #monetize :unit_price_cents
  #monetize :total_price_cents

  before_save :set_unit_price
  before_save :set_total_price

  def unit_price
    if persisted?
      self[:unit_price_cents]
    else
      orderitemable.price_cents
    end

  end

  def total_price
    unit_price * quantity
  end

  private
  def set_unit_price
    self[:unit_price_cents] = unit_price
  end

  def set_total_price
    self[:total_price_cents] = quantity * set_unit_price
  end
end
