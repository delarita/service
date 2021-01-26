class CreateSoinvisages < ActiveRecord::Migration[6.1]
  def change
    create_table :soinvisages do |t|
      t.string :name
      t.text :desciption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :soinvisages, :name, unique: true
  end
end
