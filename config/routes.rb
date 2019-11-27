Rails.application.routes.draw do
  get 'dashboard/index'
  post 'dashboard/logon'
  post 'dashboard/logoff'
    post 'dashboard/keepalive'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root '/'
end
