class User < ApplicationRecord
  has_many :goals
  has_many :created_workouts, foreign_key: "user_id", class_name: "Workout"
  has_many :borrowed_workouts, through: :goals, source: :workouts
  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
