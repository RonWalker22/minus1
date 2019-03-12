class CreateGameTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :game_teams do |t|
      t.references :game, null: false
      t.references :team, null: false

      t.timestamps
    end
    add_index :game_teams, [:team_id, :game_id], unique: true
  end
end
