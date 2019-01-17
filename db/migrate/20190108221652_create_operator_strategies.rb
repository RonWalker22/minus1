class CreateOperatorStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :operator_strategies do |t|
      t.references :operator, null: false
      t.references :strategy
      t.references :primary, foreign_key: { to_table: :objectives }
      t.references :secondary, foreign_key: { to_table: :objectives }
      t.references :tertiary, foreign_key: { to_table: :objectives }
      t.references :default, foreign_key: { to_table: :objectives }
      t.boolean :private, default: false, null: false
      t.timestamps
    end
    add_index :operator_strategies, [:operator_id, :strategy_id], unique: true
  end
end
