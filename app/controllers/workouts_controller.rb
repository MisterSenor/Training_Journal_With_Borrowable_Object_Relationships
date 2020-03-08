class WorkoutsController < ApplicationController
  before_action :require_login

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.created_workouts.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def index
    @workouts = Workout.all
  end


  private
    def workout_params
      params.require(:workout).permit(:description, :intensity, :user_id)
    end


end
