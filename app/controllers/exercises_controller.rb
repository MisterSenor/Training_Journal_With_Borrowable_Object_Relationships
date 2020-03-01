class ExercisesController < ApplicationController
  before_action :require_login

  def new
    @exercise = Exercise.new
    @exercise.build_workout
  end

  def create
    @exercise = Exercise.new(exercise_params)
        if exercise_params[:workout_attributes] != nil || exercise_params[:workout_attributes] != ""
          @workout = current_user.created_workouts.build(exercise_params[:workout_attributes])
          @exercise.workout = @workout
        end
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      binding.pry
      render :new
    end
  end
  #
  # {"name"=>"Nordic hamstring curls",
  #   "date_performed"=>"2020-02-29",
  #   "sets_reps_weights"=>"1 => 10 assisted,
  #   \r\n2 => 10 assisted, \r\n
  #   3 => 10 assisted,
  #   \r\n4 => 10 assisted",
  #   "workout_id"=>"1",
  #   "workout_attributes"=>
  #     {"description"=>"Dunk Training",
  #       "date_performed"=>"2020-02-29",
  #       "user_id"=>"1"}}

  def show
    @exercise = Exercise.find(params[:id])
  end

  private
    def exercise_params
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id, workout_attributes:[:description, :date_performed])
    end

end
