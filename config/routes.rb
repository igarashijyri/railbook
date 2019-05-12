Rails.application.routes.draw do
  resources :books
  get 'hello/index'
  get 'hello/view'
  get 'hello/list'
end
