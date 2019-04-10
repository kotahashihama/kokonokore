Rails.application.routes.draw do
  root 'home#top'
  
  get 'users' => 'users#index'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  resources :foods
  
  post 'likes/:food_id/create' => 'likes#create'
  delete 'likes/:food_id/destroy' => 'likes#destroy'
end
