class CreateMassages < ActiveRecord::Migration[6.1]
  def change
    create_table :massages do |t|
      t.string :name
      t.text :desciption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :massages, :name, unique: true
  end
end
