class WorkoutsController < ApplicationController
  before_action :require_login
  before_action :set_workout, only: [:show, :edit]

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    current_user.workouts << @workout
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def show
  end

  def index
    @workouts = current_user.workouts
  end

  def edit
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

    def set_workout
      @workout = Workout.find_by(id: params[:id])
      if !@workout 
        flash[:message] = "Workout with id #{params[:id]} does not exist."
        redirect_to workouts_path
      elsif @workout.user_id != current_user.id 
        flash[:message] = "You are not allowed to see other users' workouts."
        redirect_to workouts_path
      end 
    end 


end
