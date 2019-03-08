class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.references :recipe, foreign_key: true, null: false
      t.string :kind, null: false
      t.boolean :private, default: false, null: false

      t.timestamps
    end
    add_index :ingredients, [:recipe_id, :name], unique: true
  end
end
