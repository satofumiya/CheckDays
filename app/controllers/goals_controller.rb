class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
      flash[:notice] = "目標を保存しました"
    else
      redirect_to new_goal_path
      flash[:alert] = "目標を保存できませんでした"
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:text).merge(user_id: current_user.id)
    end
end
