Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events
  resources :users, only: [:show, :update, :edit]
  namespace :user do
    resources :events, only: [:index, :show]
    get 'events/:id/sign_out', to: 'events#sign_out', as: 'events/sign_out'
    get 'events/new/:id', to: 'events#new', as: 'events/new'
    get 'events/:id/participants', to: 'events#participants', as: 'event/participants' #todo subresrouce
    get 'events/:id/participants/:user_id/:status', to: 'events#update_status', as: 'event/participants/update_status'
  end
  root 'events#index'
end

# /users/1/events #TODO probably: resource in resource check in docs
# /users/events
# /users/me/events