
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
        
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
