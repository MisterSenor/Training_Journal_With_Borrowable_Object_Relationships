class ExercisesController < ApplicationController
  before_action :require_login

  def new
    if params[:workout_id] && @workout = Workout.find_by(id: params[:workout_id])
      @exercise = @workout.exercises.build
    else
      @exercise = Exercise.new
      @exercise.build_workout
    end
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
    @exercise = Exercise.find_by(id: params[:id])
    if Workout.find_by(id: @exercise.workout_id)
      @workout = Workout.find(@exercise.workout_id)
    end
  end

  def index
    if params[:workout_id] && @workout = Workout.find_by(id: params[:workout_id])
      @exercises = @workout.exercises
    else
      @exercises = current_user.workout_exercises || @exercises = current_user.goal_exercises
    end
  end

  def edit
    @exercise = Exercise.find_by(id: params[:id])
  end

  def update
    @exercise = Exercise.find_by(id: params[:id])
    @workout = Workout.find_by(id: @exercise.workout.id)
    if !current_user.workouts.include?(@workout)
      flash[:message] = "You cannot change other users' exercises."
      render :edit
    elsif @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end

  def destroy
    @exercise = Exercise.find_by(id: params[:id])
    @workout = Workout.find_by(id: @exercise.workout_id)
    if !current_user.workouts.include?(@workout)
      flash[:message] = "This is not your exercise to delete."
      @exercises = Exercise.all
      render :index
    end
    @exercise.destroy
    redirect_to exercises_path
  end


  private
    def exercise_params
      params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id, workout_attributes:[:description, :intensity, :user_id])
    end

    # def update_params_w_existing_workout
    #   params.require(:exercise).permit(:name, :date_performed, :sets_reps_weights, :goal_id, :workout_id)
    # end

end
