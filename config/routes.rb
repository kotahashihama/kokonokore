Rails.application.routes.draw do
  get 'foods' => 'foods#index'
  get 'foods/new' => 'foods#new'

  root 'home#top'

end
