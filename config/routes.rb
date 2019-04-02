Rails.application.routes.draw do
  get 'foods' => 'foods#index'
  get 'foods/new' => 'foods#new'
  post 'foods/create' => 'foods#create'
  get 'foods/:id' => 'foods#show'

  root 'home#top'

end
