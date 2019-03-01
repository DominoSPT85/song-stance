Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/show'
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  resources :songs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
