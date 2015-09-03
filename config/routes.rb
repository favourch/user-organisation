Rails.application.routes.draw do
  get '/organizations' => 'organizations#index', as: 'organizations'
  get '/organizations/new' => 'organizations#new'
  get '/organizations/create' => 'organizations#create'
  get '/organizations/:id/destroy' => 'organizations#destroy'
  get '/organizations/:id' => 'organizations#show', as: 'organization'
  get '/organizations/:id/edit' => 'organizations#edit'
  get '/organizations/:id/update' => 'organizations#update'
  get '/organizations/:id/contact' => 'organizations#contact'
  get '/organizations/:id/deliver' => 'organizations#deliver'

  get '/users' => 'users#index', as: 'users'
  get '/users/new' => 'users#new'
  get '/users/create' => 'users#create'
  get '/users/:id/destroy' => 'users#destroy'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/update' => 'users#update'

  root to: 'welcome#index'
  post '/login' => 'welcome#login'

  get '/dashboard' => 'dashboard#index'
end
