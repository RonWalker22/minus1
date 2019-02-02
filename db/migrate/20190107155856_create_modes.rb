class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.references :game, null:false
      t.references :level, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
