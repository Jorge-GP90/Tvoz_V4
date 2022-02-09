Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  # controllers: {
    # registrations: 'users/registrations', sessions: 'users/sessions' }
  
  root "home#top"

  resources :tasks
  resources :users
  
  # resources :users
  # only: %i[show] do
    # member do
    #   get 'profile'
    #   get 'private_message'
    #   get 'community'
    # end


  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
