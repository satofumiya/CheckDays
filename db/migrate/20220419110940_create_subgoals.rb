class CreateSubgoals < ActiveRecord::Migration[6.1]
  def change
    create_table :subgoals do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
