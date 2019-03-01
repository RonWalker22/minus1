class AddCurrentObjectiveToOperators < ActiveRecord::Migration[5.2]
  def change
    add_reference :operators, :current_objective, foreign_key: { to_table: :objectives }
  end
end
