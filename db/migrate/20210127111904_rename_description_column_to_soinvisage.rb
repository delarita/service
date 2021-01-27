class RenameDescriptionColumnToSoinvisage < ActiveRecord::Migration[6.1]
  def change
    rename_column :soinvisages, :desciption, :description
  end
end
