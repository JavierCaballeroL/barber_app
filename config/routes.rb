Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  registrations: 'sign_up'
}

  root to: "home#index"

  resources :users, only: [:show]
  resources :appointments, only: [:index, :create, :destroy]

  # Rutas administración
  get 'admin', to: 'admin#index'
  delete 'admin/destroy_user', to: 'admin#destroy_user', as: 'destroy_user'
  delete 'admin/cancel_appointment', to: 'admin#cancel_appointment', as: 'cancel_appointment'
  delete 'admin/delete_service/:id', to: 'admin#delete_service', as: 'delete_service'
  patch  'admin/update_service/:id', to: 'admin#update_service', as: 'update_service'
  post 'admin/create_service', to: 'admin#create_service', as: 'create_service'

  # Rutas información
  get "/info", to: 'info#index'
end
