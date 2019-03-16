Rails.application.routes.draw do
  devise_for :users
  resources :notes, :categories

  root to:'home#index'
end
