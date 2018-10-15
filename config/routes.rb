Rails.application.routes.draw do
  namespace :account do
    get 'dashboard', to: 'dashboard#index' 
    resources :projects do
      resources :tasks
    end
  end

  get 'dashboard', to: 'dashboard#index'

  #get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
