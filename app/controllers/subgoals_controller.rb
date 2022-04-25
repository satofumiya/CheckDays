class SubgoalsController < ApplicationController
  def index
    @goal = Goal.find_by(id: params[:goal_id])
    #@subgoals = Subgoal.where(goal_id: current_goal.id).order('created_at DESC')
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end
end
