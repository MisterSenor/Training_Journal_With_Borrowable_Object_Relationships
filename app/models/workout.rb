class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :goals, through: :exercises

  validates :description, presence: true
  validates :description, uniqueness: {message: 'Every workout must have a unique description.  If you are trying to edit an existing workout, make sure that the Create New Workout field is empty.'}
end
