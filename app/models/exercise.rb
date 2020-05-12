class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :goal

  accepts_nested_attributes_for :workout

  def workout_attributes=(workout_params)
    workout = Workout.find_or_create_by(workout_params)
    if workout.valid?
      self.workout = workout
    end
  end

  validates :date_performed, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :sets_reps_weights, presence: true
  validates_associated :workout

  scope :last_week_of_exercises,-> {order(date_performed: :desc).limit(7)}
end
