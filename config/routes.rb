Rails.application.routes.draw do
  devise_for :users
  resources :instaposts
  resources(:comments, except: [:index, :new, :edit])
  root to: "instaposts#index"
  get '/instaposts/:id/comment', to: 'comments#new', as: 'new_comment'
  get '/instaposts/:id/comment/edit', to: 'comments#new', as: 'edit_comment'
end
