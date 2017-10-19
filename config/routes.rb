Rails.application.routes.draw do
  devise_for :users
  root 'patients#index'
  resources :patients do
  	resources :day_statistics
  end
end
