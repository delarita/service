Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "epilations", to: "epilations#index"
  get "epilations/new", to: "epilations#new"


  get "massages", to: "massages#index"

  get "maquillages", to: "maquillages#index"

  get "soinvisages", to: "soinvisages#index"
end
