Rails.application.routes.draw do
  root to: 'home#index'
  get 'tweets/new'
  get 'tweets/create'
  
  

  #devise_scope :user do
    #root to: 'devise/registrations#new'
  #end 
  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  
  resources :tweets, only: %i(new create)
end
