class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.string :name, null: false
      t.timestamps
      t.boolean :private, default: false, null: false
      t.boolean :override_preference, default: false, null: false
    end
  end
end
