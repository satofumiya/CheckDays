class AddReachgoalToGoals < ActiveRecord::Migration[6.1]
  def change
    add_column :goals, :reachgoal, :boolean, default: false, null: false
  end
end
