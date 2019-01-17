class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false
      t.string :name
      t.integer :step, null: false
      t.text :content
      t.boolean :private, default: false, null: false
      t.timestamps
    end
    add_index :ingredients, [:recipe_id, :step], unique: true
  end
end
