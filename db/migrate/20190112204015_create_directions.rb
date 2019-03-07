class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.references :recipe, null: false
      t.string :name, null: false
      t.integer :step, null: false
      t.text :content, null: false
      t.boolean :private, default: false, null: false
      t.timestamps
    end
    add_index :directions, [:recipe_id, :step], unique: true
  end
end
