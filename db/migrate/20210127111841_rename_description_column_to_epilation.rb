class RenameDescriptionColumnToEpilation < ActiveRecord::Migration[6.1]
  def change
    rename_column :epilations, :desciption, :description
  end
end
