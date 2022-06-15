class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
      flash[:notice] = '目標を保存しました'
    else
      render 'new'
      flash[:alert] = '目標を保存できませんでした'
    end
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal.text == goal_params[:text]
      flash[:notice] = '目標が変わっていません。目標を変更してからボタンを押してください'
      redirect_to request.referer
    elsif @goal.text != goal_params[:text] && @goal.update(goal_params)
      flash[:success] = '目標を更新しました'
      redirect_to request.referer
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to root_path
  end

  private

  def goal_params
    params.require(:goal).permit(:text, :reachgoal).merge(user_id: current_user.id)
  end
end
