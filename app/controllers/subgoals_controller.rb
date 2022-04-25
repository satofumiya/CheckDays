class SubgoalsController < ApplicationController
  def index
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoals = Subgoal.where(goal_id: @goal.id).order('created_at DESC')
  end

  def show
  end

  def new
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = @goal.subgoals.new
  end

  def edit
  end

  def create
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = @goal.subgoals.new(subgoal_params)
    if @subgoal.save
      redirect_to goal_subgoals_path(@goal.id)
      flash[:notice] = "目標を保存しました"
    else
      render 'new'
      flash[:alert] = "目標を保存できませんでした"
    end
  end

  def destroy
  end

  def update
  end

  private
    def subgoal_params
      params.require(:subgoal).permit(:title)
    end
end
