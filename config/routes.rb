Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root "static#welcome"

  resources :sessions

  resources :users, only: [:show, :new, :create] do
    resources :tasks, only: [:index, :show, :new]
  end

  resources :projects, only: [:index, :show, :new, :create]

  resources :tasks


  get '/signout', to: 'sessions#destroy'

  get '/tasks/:id/complete', to: "tasks#complete"

  get 'tasks/:id/delete', to: "tasks#delete"

  get '/auth/facebook/callback' => 'sessions#create'
end
