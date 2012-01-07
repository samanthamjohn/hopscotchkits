Hopscotch::Application.routes.draw do

  resources :steps
  match "login/:token", to: "users#login"

  resources :signups, only: [:create, :index]
  resources :kits do
    resources :programs do
      member do
        put :next_step
      end
    end
  end
  resources :programs
  match "about", to: "welcome#about", as: "about"
  match "products", to: "welcome#products", as: "products"
  match "/products/:name", to: "welcome#product_detail", as: "product_detail"
  root :to => 'welcome#index'
end
