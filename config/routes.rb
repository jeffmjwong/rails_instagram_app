Rails.application.routes.draw do
  devise_for :users
  resources :instaposts
  resources(:comments, except: [:index])
  root to: "instaposts#index"
end
