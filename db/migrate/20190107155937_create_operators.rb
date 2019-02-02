class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :name, null: true
      t.boolean :online, default: false, null: false
      t.references :game_setting, foreign_key: { to_table: :games }
      t.string :uid
      t.string :provider
      t.timestamps
    end
    add_index :operators, [:name], unique: true
  end
end
