class AddPriceToSoinvisages < ActiveRecord::Migration[6.1]
  def change
    add_monetize :soinvisages, :price, currency: { present: false }
  end
end
