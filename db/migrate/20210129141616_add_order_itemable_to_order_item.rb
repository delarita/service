class AddOrderItemableToOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :orderitemable, polymorphic: true, null: false
  end
end
