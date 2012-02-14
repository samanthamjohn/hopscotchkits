Hopscotch::Application.routes.draw do

  resources :steps
  match "login/:token", to: "users#login"

  resources :programs do
    member do
      get :next_step
      get :data
      post :name
      get :iframe
    end
    collection do
      get :root
    end
  end
  resources :kits do
    member do
      get :analytics
    end
    resources :programs do
      collection do
        get :root
      end
      member do
        get :next_step
      end
    end
  end
  resources :programs
  root :to => 'programs#root', kit_id: "puppy"
end
