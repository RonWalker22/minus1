class AddCurrentObjectiveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :current_objective, foreign_key: { to_table: :objectives }
  end
end
