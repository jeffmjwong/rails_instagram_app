Rails.application.routes.draw do
  devise_for :users
  root to: "instaposts#index"
  resources :instaposts do
    resources :comments
  end
end
