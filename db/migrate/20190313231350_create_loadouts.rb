class CreateLoadouts < ActiveRecord::Migration[5.2]
  def change
    create_table :loadouts do |t|
      t.string :name
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :kind

      t.timestamps
    end
    add_index :loadouts, [:name, :game_id], unique: true
  end
end
