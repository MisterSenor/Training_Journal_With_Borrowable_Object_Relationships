class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :goal

  accepts_nested_attributes_for :workout
end
