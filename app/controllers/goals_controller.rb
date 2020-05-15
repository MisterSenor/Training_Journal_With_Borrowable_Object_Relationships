class GoalsController < ApplicationController
  before_action :require_login
  before_action :set_goal, only: [:show, :edit]


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
  end

  def index
    @goals = current_user.goals
  end

  def edit
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
    params.require(:goal).permit(:description, :achieved_status, :date_achieved, :user_id)
  end

  def set_goal 
    @goal = Goal.find_by(id: params[:id])
    if !@goal
      flash[:message] = "A goal with id #{params[:id]} does not exist." 
      redirect_to goals_path 
    elsif @goal.user_id != current_user.id 
      flash[:message] = "You aren't allowed to see other users' goals."
      redirect_to goals_path
    end 
  end 


end
