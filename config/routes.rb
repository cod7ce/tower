Rails.application.routes.draw do
  resources :teams do
    resources :events, only: [:index]
  end

  resources :projects do
    resources :todos, only: [:show]
  end

  resources :users, only: [:show]
end
