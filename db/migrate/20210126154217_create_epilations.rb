class CreateEpilations < ActiveRecord::Migration[6.1]
  def change
    create_table :epilations do |t|
      t.string :name
      t.text :desciption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :epilations, :name, unique: true
  end
end
