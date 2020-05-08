class User < ApplicationRecord
  has_many :workouts
  has_many :goals
  has_many :workout_exercises, through: :workouts
  has_many :goal_exercises, through: :goals
  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
