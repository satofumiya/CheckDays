Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :goals, except: [:index] do
    resources :subgoals
  end

  #devise_scope :user do
    #root to: 'devise/registrations#new'
  #end 
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  
  
end
