class AddPriceToEpilations < ActiveRecord::Migration[6.1]
  def change
    add_monetize :epilations, :price, currency: { present: false }
  end
end
