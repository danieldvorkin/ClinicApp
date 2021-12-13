Rails.application.routes.draw do
  resources :assessments
  devise_for :users
  root to: 'page#home'
  get '/my_assessments', to: 'assessments#my_assessments'
  post '/assessments/:assessment_id/new_assignment', to: 'assessments#new_assignment', as: 'new_assignment'
  delete '/assessments/:assessment_id/destroy_assignment', to: 'assessments#remove_assignment', as: 'remove_assignment'
  get '/users', to: 'page#users'  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/user/:uuid', to: 'page#user', as: 'profile'
  post '/user/:uuid/update_role', to: 'page#update_role', as: 'update_role'
end
