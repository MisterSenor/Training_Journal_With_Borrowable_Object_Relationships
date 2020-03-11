class ExercisesController < ApplicationController
  before_action :require_login

  def new
    @exercise = Exercise.new
    @exercise.build_workout
  end

  def create
    @exercise = Exercise.new(exercise_params)
      if exercise_params[:workout_id]
        @exercise.workout_id = exercise_params[:workout_id]
      end
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      render :new
    end
  end


  def show
    @exercise = Exercise.find(params[:id])
    @workout = Workout.find(@exercise.workout_id)
  end

  def index
    @exercises = Exercise.all
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end




  private
    def exercise_params
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id, workout_attributes:[:description, :intensity, :user_id])
    end

end
