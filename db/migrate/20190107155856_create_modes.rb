class CreateModes < ActiveRecord::Migration[5.2]
  def change
    create_table :modes do |t|
      t.references :game, null:false
      t.string :name, null: false
      t.references :operator, foreign_key: true
      t.timestamps
    end
  end
end
