class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :goal

  accepts_nested_attributes_for :workout
  validates :date_performed, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :sets_reps_weights, presence: true

end
