class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises, foreign_key: "workout_id", class_name: "Exercise"
  has_many :goals, through: :exercises
  

  validates :description, presence: true
  validates :description, uniqueness: {message: 'Every workout must have a unique description. Try adding the date to the name to make it unique.  If you are trying to edit an existing workout, make sure that the Create New Workout field is empty. '}
end
