class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.references :game, foreign_key: true, null: false
      t.references :operator, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
    add_index :levels, [:name, :game_id], unique: true
  end
end
