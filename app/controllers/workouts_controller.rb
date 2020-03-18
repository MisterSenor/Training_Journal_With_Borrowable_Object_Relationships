class WorkoutsController < ApplicationController
  before_action :require_login

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    current_user.created_workouts << @workout
    #@workout = current_user.created_workouts.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def index
    @workouts = Workout.all
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.user_id != current_user.id
      flash[:message] = "You can't delete this workout because it's not yours."
      render :index
    end
    @workout.destroy
    redirect_to workouts_path
  end


  private
    def workout_params
      params.require(:workout).permit(:description, :intensity, :user_id)
    end


end
