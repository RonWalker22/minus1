class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :level, foreign_key: true

      t.timestamps
    end
    add_index :locations, [:name, :level_id], unique: true
  end
end
