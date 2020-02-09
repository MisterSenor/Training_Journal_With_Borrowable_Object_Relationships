class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.datetime :date_performed
      t.string :sets_reps_weights
      t.integer :goal_id
      t.integer :workout_id

      t.timestamps
    end
  end
end
