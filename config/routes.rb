Hopscotch::Application.routes.draw do

  resources :steps
  match "login/:token", to: "users#login"

  resources :kits do
    resources :programs do
      member do
        put :next_step
      end
    end
  end
  resources :programs
  root :to => 'programs#new', kit_id: "puppy"
end
