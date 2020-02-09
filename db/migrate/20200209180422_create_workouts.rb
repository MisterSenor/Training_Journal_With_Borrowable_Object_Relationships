class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.datetime :date_performed
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
