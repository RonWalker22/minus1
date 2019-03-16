class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipe, foreign_key: true, null: false
      t.string :piece_type
      t.integer :piece_id
      t.references :parent, foreign_key: { to_table: :ingredients }
      t.timestamps
    end
    add_index :ingredients, [:piece_type, :piece_id]
    add_index :ingredients, [:piece_type, :piece_id, :recipe_id], unique: true
  end
end
