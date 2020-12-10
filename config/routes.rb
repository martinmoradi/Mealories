
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

end
