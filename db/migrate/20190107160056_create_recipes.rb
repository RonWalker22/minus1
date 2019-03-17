class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.references :objective
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.uuid :uuid
      t.timestamps
    end
  end
end
