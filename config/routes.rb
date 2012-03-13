Hopscotch::Application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations", sessions: "sessions" }

  resources :steps
  match "login/:token", to: "users#login"

  resources :programs do
    member do
      get :next_step
      get :data
      post :name
      get :iframe
      put :feature
      get :show_code
      get :mobile
    end
    collection do
      get :root
      get :gallery
    end
  end
  match "/gallery", to: "programs#gallery", as: :gallery
  resources :kits do
    member do
      get :analytics
    end
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
  root :to => 'programs#root', kit_id: "puppy"
end
