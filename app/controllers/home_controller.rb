class HomeController < ApplicationController
  def index
    if user_signed_in?
      @tweets = Tweet.includes(:user).order('created_at DESC')
    else
      redirect_to new_user_session_path
    end
  end
end
