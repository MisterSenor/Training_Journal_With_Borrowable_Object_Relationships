class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :goals, through: :exercises
end
