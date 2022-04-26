class SubgoalsController < ApplicationController
  def index
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoals = Subgoal.where(goal_id: @goal.id).order('created_at DESC')
  end

  def show
    @subgoal = Subgoal.find_by(id: params[:id])
  end

  def new
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = @goal.subgoals.new
  end

  def edit
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = Subgoal.find_by(id: params[:id])
  end

  def create
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = @goal.subgoals.new(subgoal_params)
    if @subgoal.save
      redirect_to goal_subgoals_path(@goal.id)
      flash[:notice] = "サブゴールを保存しました"
    else
      render 'new'
      flash[:alert] = "サブゴールを保存できませんでした"
    end
  end

  def destroy
    @goal = Goal.find_by(id: params[:goal_id])
    subgoal = Subgoal.find_by(id: params[:id])
    subgoal.destroy
    redirect_to goal_subgoals_path(@goal.id)
  end

  def update
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = Subgoal.find_by(id: params[:id])
    if @subgoal.update(subgoal_params)
      flash[:success] = "サブゴールをを更新しました"
      redirect_to goal_subgoals_path(@goal.id)
    else
      render 'edit'
    end
  end

  private
    def subgoal_params
      params.require(:subgoal).permit(:title)
    end
end
