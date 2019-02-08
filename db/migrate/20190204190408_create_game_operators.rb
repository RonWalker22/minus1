class CreateGameOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :game_operators do |t|
      t.references :operator, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false

      t.timestamps
    end
    add_index :game_operators, [:operator_id, :game_id], unique: true
  end
end
