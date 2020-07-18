Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'u/:username', to: 'public#profile', as: :profile
  get 'about', to: 'public#about', as: :about
  get 'contact', to: 'public#contact', as: :contact

  resources :posts do
    resources :comments
  end

  root to: 'public#index'
end
