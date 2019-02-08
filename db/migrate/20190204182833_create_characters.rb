class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.references :game, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :characters, [:name, :game_id], unique: true
  end
end
