
Rails.application.routes.draw do
  root 'static#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  scope 'users', module: 'users' do 
    resources :plans do
      resources :days
    end
    resources :users, path: "/"
    resources :recipes
        
  end
  
end
