class HomeController < ApplicationController
  def index
    if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.id).order('created_at DESC')
      @goals = Goal.where(user_id: current_user.id).order('created_at DESC')
    else
      redirect_to new_user_session_path
    end
  end
end
