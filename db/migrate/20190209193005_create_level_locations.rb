class CreateLevelLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :level_locations do |t|
      t.references :level, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
    add_index :level_locations, [:level_id, :location_id], unique: true
  end
end
