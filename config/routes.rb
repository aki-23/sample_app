Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  # namespace :groups do
  #   resources :searchs, only: :index
  # end
  
  resources :groups, only: [:index] do
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
