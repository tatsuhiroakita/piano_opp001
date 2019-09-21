Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  root to: 'users#index'
  get 'users/index'
  ##devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :card, only: [:new, :show] do
   collection do
     post 'show', to: 'card#show'
     post 'pay', to: 'card#pay'
     post 'delete', to: 'card#delete'
   end
  end
end
