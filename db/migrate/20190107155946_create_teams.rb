class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: true
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.timestamps
    end
    add_index :teams, [:name], unique: true
  end
end
