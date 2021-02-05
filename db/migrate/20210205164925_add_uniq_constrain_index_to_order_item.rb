class AddUniqConstrainIndexToOrderItem < ActiveRecord::Migration[6.1]
  def change
    remove_index :order_items, name: "index_order_items_on_orderitemable"
    add_index :order_items, [:order_id, :orderitemable_type, :orderitemable_id], unique: true, name: 'uniq_order_index'
  end
end
