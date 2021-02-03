Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "about", to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :epilations do
    resources :order_items, only: [:create, :update, :destroy]
  end

  #resources :epilations, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  # get "epilations", to: "epilations#index"
  # get "epilations/new", to: "epilations#new"
  # post "epilations", to: "epilations#create"
  # get "epilations/:id/edit", to: "epilations#edit"
  # patch "epilations/:id", to: "epilations#update"

  resources :massages do
    resources :order_items, only: [:create, :update, :destroy]
  end

  #resources :massages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "massages", to: "massages#index"

  resources :maquillages do
    resources :order_items, only: [:create, :update, :destroy]
  end
  #resources :maquillages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "maquillages", to: "maquillages#index"

  resources :soinvisages do
    resources :order_items, only: [:create, :update, :destroy]
  end
  #resources :soinvisages, only: [:index, :show, :new, :edit, :update, :create, :destroy]
  #get "soinvisages", to: "soinvisages#index"

  # Faut t'il plutot nester ?
  # resources :epilations, :massages, :maquillages, :soinvisages do
  #resources :order_items, only: [:create, :update, :destroy]
  # end

  #
  resources :carts, only: [:index]

end
