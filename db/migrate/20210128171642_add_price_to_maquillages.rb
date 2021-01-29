class AddPriceToMaquillages < ActiveRecord::Migration[6.1]
  def change
    add_monetize :maquillages, :price, currency: { present: false }
  end
end
