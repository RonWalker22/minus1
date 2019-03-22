class CreateStrategyTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :strategy_teams do |t|
      t.references :strategy, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
    add_index :strategy_teams, [:team_id, :strategy_id], unique: true
  end
end
