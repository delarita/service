Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :epilations, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  # get "epilations", to: "epilations#index"
  # get "epilations/new", to: "epilations#new"
  # post "epilations", to: "epilations#create"
  # get "epilations/:id/edit", to: "epilations#edit"
  # patch "epilations/:id", to: "epilations#update"

  resources :massages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "massages", to: "massages#index"

  resources :maquillages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "maquillages", to: "maquillages#index"

  resources :soinvisages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "soinvisages", to: "soinvisages#index"
end
