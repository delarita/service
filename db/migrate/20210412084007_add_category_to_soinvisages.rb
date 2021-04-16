class AddCategoryToSoinvisages < ActiveRecord::Migration[6.1]
  def change
    add_column :soinvisages, :category, :string
  end
end
