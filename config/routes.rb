Hopscotch::Application.routes.draw do

  resources :steps

  resources :signups, only: :create
  resources :kits do
    resources :programs
  end
  root :to => 'welcome#index'
end
