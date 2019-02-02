class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.references :mode
      t.references :level
      t.references :game
      t.references :inspiration, foreign_key: { to_table: :strategies }
      t.string :name, null: false
      t.boolean :private, default: false, null: false
      t.boolean :natural_flow, default: true, null: false
      t.timestamps
    end
  end
end
