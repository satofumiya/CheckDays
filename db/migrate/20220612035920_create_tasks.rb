class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :done
      t.integer :subgoal_id

      t.timestamps
    end
  end
end
