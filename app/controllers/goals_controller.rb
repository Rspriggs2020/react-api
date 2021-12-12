class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  def index
    @goals = Goal.all
    render json: @goals
  end

  def show
    render json: @goal
  end

  def create
    @goal = Goal.create(goal_params)
    if @goal.save
    render json: @goal, status: :created, location: @goal
    else
      render json: {error: "Comment could not be created"}
  end

  def update
    if @goal.update(goal_params)
      render json: @goal
    else
      render json: {error: "Looks like something went wrong"}
    end
  end

  def destroy
    @goal.destroy
  end

  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:title, :description, :completed)
    end
end
