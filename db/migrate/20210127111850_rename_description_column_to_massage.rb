class RenameDescriptionColumnToMassage < ActiveRecord::Migration[6.1]
  def change
    rename_column :massages, :desciption, :description
  end
end
