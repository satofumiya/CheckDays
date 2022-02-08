Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: [:show]
  resources :tweets, only: [:new, :create]
  resources :goals, except: [:index]

  #devise_scope :user do
    #root to: 'devise/registrations#new'
  #end 
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  
  
end
