class WorkoutsController < ApplicationController
  before_action :require_login

  def new
    @workout = Workout.new
  end

  def create
  end

  def show
  end

end
