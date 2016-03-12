Rails.application.routes.draw do
  root 'entrepreneurs#index'

  devise_for :users
  resources :entrepreneurs

  get 'profile' => 'profile#index'
  get 'profile/edit_password'
  post 'profile/change_password' => 'profile#change_password'

  namespace :api do
    namespace :v1 do
      resources :entrepreneurs
      post 'sign_in' => 'sessions#sign_in'
      post 'sign_up' => 'sessions#sign_up'
    end
  end



end
