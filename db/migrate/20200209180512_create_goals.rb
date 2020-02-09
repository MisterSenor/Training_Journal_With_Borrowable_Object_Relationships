class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :description
      t.string :achieved_status
      t.string :boolean
      t.integer :user_id
      t.datetime :date_achieved

      t.timestamps
    end
  end
end
