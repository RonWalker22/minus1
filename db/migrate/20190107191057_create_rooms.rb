class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :commander,
                   foreign_key: { to_table: :users },
                   null: false
      t.references :strategy
      t.integer :kill_counter, default: 0, null: false
      t.boolean :active, default: false, null: false
      t.string :name, null: false
      t.timestamps
      t.boolean :private, default: false, null: false
      t.boolean :override_preference, default: false, null: false
    end
  end
end
