Rails.application.routes.draw do
  get 'foods' => 'foods#index'
  get 'foods/new' => 'foods#new'
  post 'foods/create' => 'foods#create'
  get 'foods/:id' => 'foods#show'
  get 'foods/:id/edit' => 'foods#edit'
  post 'foods/:id/update' => 'foods#update'
  delete 'foods/:id' => 'foods#destroy'

  root 'home#top'

end
