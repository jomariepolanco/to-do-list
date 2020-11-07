Rails.application.routes.draw do
  resources :teams
  resources :users
  resources :tasks
  post '/tasks/:id', to: 'tasks#complete_task', as: 'complete_task'
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
