class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teams do |t|
      t.references :user, null: false
      t.references :team, null: false
      t.string :title, default: 'User', null: false 
      t.timestamps
    end
    add_index :user_teams, [:user_id, :team_id], unique: true
  end
end
