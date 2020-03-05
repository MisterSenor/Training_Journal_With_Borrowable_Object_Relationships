class ExercisesController < ApplicationController
  before_action :require_login

  def new
    @exercise = Exercise.new
    @exercise.build_workout
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      render :new
    end
  end


  def show
    @exercise = Exercise.find(params[:id])
  end

  def index
    @exercises = Exercise.all
  end


  private
    def exercise_params
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id, workout_attributes:[:description, :date_performed, :user_id])
    end

end
