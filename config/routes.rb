Rails.application.routes.draw do
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books
  get 'hello/index'
  get 'hello/view'
  get 'hello/list'
end
