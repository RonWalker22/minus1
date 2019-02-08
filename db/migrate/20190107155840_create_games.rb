class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :website
      t.string :image_id
      t.integer :igdb_id
      t.string :status, default: 'proposal', null: false
      t.timestamps
    end
    add_index :games, [:igdb_id], unique: true
    add_index :games, :name, unique: true
    add_index :games, :website, unique: true
  end
end
