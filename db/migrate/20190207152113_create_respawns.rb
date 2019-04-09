class CreateRespawns < ActiveRecord::Migration[5.2]
  def change
    create_table :respawns do |t|
      t.references :game, foreign_key: true, null: false
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :respawns, [:name, :game_id], unique: true
  end
end
