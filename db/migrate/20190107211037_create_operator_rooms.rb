class CreateOperatorRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :operator_rooms do |t|
      t.references :operator, null: false
      t.references :objective
      t.references :room, null: false
      t.boolean :alive, default: true, null: false
      t.timestamps
    end
    add_index :operator_rooms, [:operator_id, :room_id], unique: true
  end
end
