Rails.application.routes.draw do
  get 'reviews/index'
  get 'salons/index'
  #devise_for :users
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  root to: 'pages#home'
  get "about", to: 'pages#about'
  get "contact", to: 'pages#contact'
  resources :reviews do
    match '/scrape', to: 'reviews#scrape', via: :post, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


 resources :salons,  only: [:index]

  resources :epilations do
    resources :order_items, only: [:create, :update, :destroy]
  end

  resource :contacts, only: [:new, :create] do
    get "/thanks" => "contacts#thanks"
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
  resources :orders, only: [:index, :show, :destroy]

  resources :carts, only: [:index]
  resources :carts, only: [:new], as: :order do
    resources :payments, only: [:new]
  end

  get '*unmatched_route', to: 'application#raise_not_found'
end
