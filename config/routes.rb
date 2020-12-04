
Rails.application.routes.draw do
  root 'static#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  

  scope 'users', module: 'users' do 
    resources :plans do
      resources :days
      resources :recipes, only: %i[index, show]
    end    
    resources :users, path: "/"
    resources :recipes
  end
  
end
