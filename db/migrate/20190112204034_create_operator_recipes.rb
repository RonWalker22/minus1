class CreateOperatorRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :operator_recipes do |t|
      t.references :operator, null: false
      t.references :recipe, null: false
      t.timestamps
    end
    add_index :operator_recipes, [:operator_id, :recipe_id], unique: true
  end
end
