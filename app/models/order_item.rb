class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :orderitemable, :polymorphic => true
  #belongs_to :epilation

  #monetize :unit_price_cents
  #monetize :total_price_cents

  before_save :set_unit_price
  before_save :set_total_price

  def unit_price
    puts "in -------------------- in orderitem unit price"
    #p self
    #p "self"
    #p self.orderitemable_id
    #p orderitemable
    #p "after orderitemable"
    if persisted?
      #p "in persisted"
      #p self[:unit_price_cents]
      #p "apres self_unit_price_cents"
      self[:unit_price_cents]
    else
      #p "---- else in unit price"
      #p orderitemable.price
      #p "---- else out unit price"
      #Money.new(orderitemable.price,"EUR")
      orderitemable.price_cents
    end
    #p "sortie de unit_price"
  end

  def total_price
    puts "in -------------------- in orderitem total_price"
    puts "total_price"
    p unit_price * quantity
    unit_price * quantity
  end

  private

    def set_unit_price
      puts "-------------------- in orderitem 1"
      self[:unit_price_cents] = unit_price
    end

    def set_total_price
      puts "-------------------- in orderitem 2"
      self[:total_price_cents] = quantity * set_unit_price
    end
end
