Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  registrations: 'sign_up'
}

  root to: "home#index"

  resources :users, only: [:show]
  get "/appointments", to: "appointments#index"



end
