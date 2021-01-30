class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.monetize :total_price, currency: { present: false }
      t.monetize :subtotal_price, currency: { present: false }

      t.timestamps
    end
  end
end
