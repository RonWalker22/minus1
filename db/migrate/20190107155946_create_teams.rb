class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.references :commander,
                   foreign_key: { to_table: :operators },
                   null: false
      t.string :password

      #for merit gem
      t.integer :sash_id
      t.integer :level, default: 0

      t.timestamps
    end
    add_index :teams, [:name], unique: true
  end
end
