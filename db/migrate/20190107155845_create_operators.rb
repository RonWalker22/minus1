class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :name, null: false
      t.boolean :online, default: false, null: false
      t.references :game_setting, foreign_key: { to_table: :games }, default: 1
      t.references :room
      
      #for omniauth gems
      t.string :uid
      t.string :provider
      t.string :api_key
      
      # for email - encrypted data
      t.string :encrypted_email
      t.string :encrypted_email_iv

      # for email - blind index
      t.string :encrypted_email_bidx

      t.timestamps
    end
    add_index :operators, [:name], unique: true
    add_index :operators, :encrypted_email_iv, unique: true
    add_index :operators, :encrypted_email_bidx, unique: true
  end
end
