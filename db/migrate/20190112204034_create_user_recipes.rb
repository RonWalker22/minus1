class CreateUserRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_recipes do |t|
      t.references :user, null: false
      t.references :recipe, null: false
      t.timestamps
    end
    add_index :user_recipes, [:user_id, :recipe_id], unique: true
  end
end
