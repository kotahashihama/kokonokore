Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  get 'foods' => 'foods#index'
  get 'foods/new' => 'foods#new'
  post 'foods/create' => 'foods#create'
  get 'foods/:id' => 'foods#show'
  get 'foods/:id/edit' => 'foods#edit'
  post 'foods/:id/update' => 'foods#update'
  delete 'foods/:id' => 'foods#destroy'

  root 'home#top'

end
