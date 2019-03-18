class CreateOperatorTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :operator_teams do |t|
      t.references :operator, null: false
      t.references :team, null: false
      t.string :title, default: 'Operator', null: false 
      t.timestamps
    end
    add_index :operator_teams, [:operator_id, :team_id], unique: true
  end
end
