Rails.application.routes.draw do
  devise_for :users
  resources :instaposts
  resources :comments, except: [:index, :new]
  root to: "instaposts#index"
  get '/instaposts/:id/comment', to: 'comments#new', as: 'new_comment'
end
