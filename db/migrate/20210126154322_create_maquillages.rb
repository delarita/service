class CreateMaquillages < ActiveRecord::Migration[6.1]
  def change
    create_table :maquillages do |t|
      t.string :name
      t.text :desciption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :maquillages, :name, unique: true
  end
end
