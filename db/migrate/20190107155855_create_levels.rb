class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.references :game, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :levels, [:name, :game_id], unique: true
  end
end
