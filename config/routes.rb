Hopscotch::Application.routes.draw do

  resources :steps
  match "login/:token", to: "users#login"

  resources :signups, only: :create
  resources :kits do
    resources :programs
  end
  match "about", to: "welcome#about", as: "about"
  root :to => 'welcome#index'
end
