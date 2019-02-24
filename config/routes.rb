Rails.application.routes.draw do
  devise_for :users
  resources :notes, :categories

  # get 'notes/index'
  # get 'notes/edit'
  # get 'notes/new'
  # get 'notes/show'
  # get 'categories/index'
  # get 'categories/edit'
  # get 'categories/new'
  # get 'categories/show'
  # get 'home/index'

  root to:'home#index'
end
