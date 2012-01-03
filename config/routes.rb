Hopscotch::Application.routes.draw do

  resources :steps
  match "login/:token", to: "users#login"

  resources :signups, only: :create
  resources :kits do
    resources :programs
  end
  root :to => 'welcome#index'
end
