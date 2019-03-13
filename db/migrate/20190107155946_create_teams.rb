class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.string :password

      t.timestamps
    end
    add_index :teams, [:name], unique: true
  end
end
