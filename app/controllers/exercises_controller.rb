class ExercisesController < ApplicationController
  before_action :require_login

  def new
    @exercise = Exercise.new
  end

  def create
  end

  def show
  end

end
