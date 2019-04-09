class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :game, foreign_key: true, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :locations, [:name, :game_id], unique: true
  end
end
