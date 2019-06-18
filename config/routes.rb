Rails.application.routes.draw do
  namespace :admin do
    resources :books
  end
  resources :members
  resources :fan_comments
  resources :reviews
  constraints(id: /[0-9]{1,2}/) do
    resources :authors
    resources :users
  end
  resources :books, constraints: { id: /[0-9]{1,2}/ }
  get 'hello/index'
  get 'hello/view'
  get 'hello/list'
  get 'view/keyword'
  post 'keyword/search'
  get 'view/form_tag'
  post 'view/create'
  get 'view/form_for'
  get 'view/field'
  get 'view/html5'
  get 'view/select'
  get 'view/col_select'
  get 'view/group_select'
  get 'record/find'
  get 'record/find_by'
  get 'record/find_by2'
  get 'record/where'
  get 'record/keyword'
  post 'record/ph1'
  get 'record/not(/:id)' => 'record#not'
  get 'record/where_or'
  get 'record/order'
  get 'record/select'
  get 'record/select2'
  get 'record/offset'
  get 'record/groupby'
  get 'record/where2'
  get 'record/scope'
  get 'record/def_scope'
  get 'record/transact'
  get 'record/belongs'
  get 'record/has_and_belongs'
  get 'record/has_many_through'
  get 'record/memorize'
  get 'view/adopt'
  get 'view/partial_basic'
  get 'record/assoc_join'
  get 'ctrl/get_xml'
  get 'ctrl/cookie'
  post 'ctrl/cookie_rec'
  get 'ctrl/session_show'
  post 'ctrl/session_rec'
  get 'ctrl/index'
  get 'login/index'
  post 'login/auth'
  get 'ctrl/device'
  get 'ajax/index'
  get 'ajax/upanel'
  get 'ajax/search'
  post 'ajax/result'
end
