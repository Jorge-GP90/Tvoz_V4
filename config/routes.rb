Rails.application.routes.draw do

  devise_for :users
  root "home#top"
  # root "task#index"
  resources :tasks


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
