Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  get 'foods' => 'foods#index'
  get 'foods/new' => 'foods#new'
  post 'foods/create' => 'foods#create'
  get 'foods/:id' => 'foods#show'
  get 'foods/:id/edit' => 'foods#edit'
  post 'foods/:id/update' => 'foods#update'
  delete 'foods/:id' => 'foods#destroy'
  
  post 'likes/:food_id/create' => 'likes#create'
  post 'likes/:food_id/destroy' => 'likes#destroy'

  root 'home#top'
  get 'about' => 'home#about'
end
