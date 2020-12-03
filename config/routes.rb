
Rails.application.routes.draw do
  root 'static#index'
  devise_for :users
  
  scope 'users', module: 'users', shallow: true do 
    resources :plans
    resources :days
    resources :users
    resources :recipes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
