class Goal < ApplicationRecord
  has_many :exercises
  has_many :workouts, through: :exercises
  belongs_to :user
end
