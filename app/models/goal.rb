class Goal < ApplicationRecord
  has_many :goal_exercises, foreign_key: "goal_id", class_name: "Exercise"
  has_many :workouts, through: :goal_exercises
  belongs_to :user
  validates :description, presence: true
end
