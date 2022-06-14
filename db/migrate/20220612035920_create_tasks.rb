class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done, default: false
      t.integer :subgoal_id

      t.timestamps
    end
  end
end
