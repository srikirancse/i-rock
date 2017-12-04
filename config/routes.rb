Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  resources :achievements
  root to: 'welcome#index'
end
