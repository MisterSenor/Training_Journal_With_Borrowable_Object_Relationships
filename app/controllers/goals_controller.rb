class GoalsController < ApplicationController
  before_action :require_login

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end


  def show
    @goal = Goal.find(params[:id])
    if current_user.id != @goal.user_id
      flash[:message] = "You can't see other users' goals."
      redirect_to goals_path
    end 
  end

  def index
    @goals = current_user.goals
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :achieved_status, :date_achieved)
  end


end
