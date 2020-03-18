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
      elsif exercise_params[:workout_attributes]
        @workout = Workout.new(exercise_params[:workout_attributes])
        @exercise.workout_id = @workout.id
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
      if @exercise.workout.user_id != current_user.id
        flash[:message] = "You are not eligible to see other users' exercises."
        redirect_to exercises_path
      end
  end

  def index
    @workouts = current_user.created_workouts
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.workout.user_id != current_user.id
      flash[:message] = "You cannot change other users' exercises."
      redirect_to exercises_path
    end
    if @exercise.update(update_params_w_existing_workout)
      redirect_to exercise_path(@exercise)
    elsif @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end



  private
    def exercise_params
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id, workout_attributes:[:description, :intensity, :user_id])
    end

    def update_params_w_existing_workout
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id)
    end

end
