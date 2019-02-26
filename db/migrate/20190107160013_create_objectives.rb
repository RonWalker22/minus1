class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.references :master,
                   foreign_key: { to_table: :objectives }
      t.references :next, foreign_key: { to_table: :objectives }
      t.references :strategy, null: false
      t.string :name, null: false
      t.references :target, foreign_key: { to_table: :locations }
      t.string :action, null: false
      t.integer :delay, default: 0, null: false
      t.integer :min_ops, default: 1, null: false
      t.integer :max_ops, default: 1, null: false
      t.integer :priority, default: 10, null: false
      t.timestamps
    end
  end
end
