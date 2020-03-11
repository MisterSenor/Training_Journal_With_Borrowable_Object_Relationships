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
  end

  def index
    @goals = Goal.all
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :achieved_status, :date_achieved)
  end


end
