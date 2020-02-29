Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#home'
  get 'groups', to: 'groups#index'

  resources :users,only: [:show]
  
  resources :groups, only: [:new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
      get 'grouplist'
      get 'grouprank'
    end
  end
end
