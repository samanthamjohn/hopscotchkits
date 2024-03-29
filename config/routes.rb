Hopscotch::Application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions" }

  resources :steps
  match "login/:token", to: "users#login"

  resources :programs do
    member do
      get :next_step
      get :previous_step
      get :data
      post :name
      get :iframe
      put :feature
      get :show_code
      get :mobile
    end
    collection do
      get :my
      get :gallery
    end
  end
  match "/gallery", to: "programs#gallery", as: :gallery
  namespace :admin do
    resources :kits do
      member do 
        get :analytics
      end
    end
  end
  resources :kits do
    resources :programs do
      collection do
        get :root
        get :new_form
      end
      member do
        get :next_step
      end
    end
  end
  resources :programs
  root :to => 'kits#index'
end
