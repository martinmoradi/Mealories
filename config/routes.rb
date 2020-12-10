
Rails.application.routes.draw do
  root 'static#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  scope 'users', module: 'users' do 
    resources :plans do
      resources :days
    end
    resources :users, path: "/"
    resources :recipes, only: [:show]
  end

  namespace :admins do
    resources :admins
    resources :recipes, only: [:show, :create, :new]
  end
<<<<<<< HEAD
        
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
=======

>>>>>>> 37d0f23544839f5ce36932a33707cbf73af3bad1
end
