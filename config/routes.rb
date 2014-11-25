Rails.application.routes.draw do
  get 'tags', :to => 'tags#index', :as => 'tags'
  get 'about', :to => 'about#index', :as => 'about'
  resources :contacts
  resources :tags, only: [] do
    resources :apps, only: [:index]
  end
  
  devise_for :admins
  get 'admin', :to => 'admin#index'
  get 'admins', :to => 'admin#index'
  namespace :admin do
    resources :apps
    resources :tags
    resources :tags, only: [] do
      resources :apps, only: [:index]
    end
    resources :abouts
    resources :contacts
  end

  root 'apps#index'
end
