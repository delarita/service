class AddPriceToMassages < ActiveRecord::Migration[6.1]
  def change
    add_monetize :massages, :price, currency: { present: false }
  end
end
