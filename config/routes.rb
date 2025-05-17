Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  registrations: 'sign_up'
}

  root to: "home#index"

  resources :users, only: [:show]
  resources :appointments, only: [:index, :create, :destroy]

  get 'admin', to: 'admin#index'


end
