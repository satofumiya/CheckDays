Rails.application.routes.draw do
  root to: 'home#index'
  resources :tweets, only: %i(new create)
  resources :goals, only: %i(new create)

  #devise_scope :user do
    #root to: 'devise/registrations#new'
  #end 
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  
  
end
