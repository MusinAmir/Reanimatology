Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'patients#index'
  resources :patients do
    member do
      get 'add_information'
    end
    resources :day_statistics
  end
  get '*path' => redirect('/')
end
