class CreateLevelRespawns < ActiveRecord::Migration[5.2]
  def change
    create_table :level_respawns do |t|
      t.references :level, foreign_key: true, null: false
      t.references :respawn, foreign_key: true, null: false

      t.timestamps
    end
    add_index :level_respawns, [:level_id, :respawn_id], unique: true
  end
end
