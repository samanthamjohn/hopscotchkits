Hopscotch::Application.routes.draw do
  resources :signups, only: :create
  root :to => 'welcome#index'
end
