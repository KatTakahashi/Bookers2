Rails.application.routes.draw do

  get 'homes/top'
  get 'homes/about'
  devise_for :users
  resources :users, only:[:show, :edit, :update, :destroy]
  resources :books, only:[:index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
