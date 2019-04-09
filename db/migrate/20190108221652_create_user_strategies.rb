class CreateUserStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_strategies do |t|
      t.references :user, null: false
      t.references :strategy, null: false
      t.references :objective
      t.references :primary, foreign_key: { to_table: :objectives }
      t.references :secondary, foreign_key: { to_table: :objectives }
      t.references :tertiary, foreign_key: { to_table: :objectives }
      t.references :default, foreign_key: { to_table: :objectives }
      t.boolean :private, default: false, null: false
      t.timestamps
    end
    add_index :user_strategies, [:user_id, :strategy_id], unique: true
  end
end
