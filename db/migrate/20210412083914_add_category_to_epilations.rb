class AddCategoryToEpilations < ActiveRecord::Migration[6.1]
  def change
    add_column :epilations, :category, :string
  end
end
