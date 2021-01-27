class RenameDescriptionColumnToMaquillage < ActiveRecord::Migration[6.1]
  def change
    rename_column :maquillages, :desciption, :description
  end
end
