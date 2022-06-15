class Api::TasksController < ApplicationController
  def index
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = Subgoal.find_by(id: params[:subgoal_id])
    @tasks = Task.where(subgoal_id: @subgoal.id)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.permit(:title, :subgoal_id)
  end
end
