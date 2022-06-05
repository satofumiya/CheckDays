Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :goals, except: [:index] do
    resources :subgoals
  end

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end 
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show]
  
end
