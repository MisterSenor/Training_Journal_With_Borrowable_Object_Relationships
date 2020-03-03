class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :description
      t.boolean :achieved_status
      t.integer :user_id
      t.datetime :date_achieved

      t.timestamps
    end
  end
end
