Rails.application.routes.draw do
  resources :instaposts
  devise_for :users
  root to: "instaposts#index"
end
