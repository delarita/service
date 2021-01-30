class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.monetize :unit_price, currency: { present: false }
      t.monetize :total_price, currency: { present: false }
      t.integer :quantity

      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
