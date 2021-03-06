Rails.application.routes.draw do
  get 'comments/new'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
    collection do
      post :search
    end
  end

  resources :notes, only: [:show, :create, :edit, :update, :destroy, :new] do
    member do
      get :liking_users
    end
  end

  post '/like/:note_id' => 'likes#like', as: 'like'

  delete '/unlike/:note_id' => 'likes#unlike', as:'unlike'

  root 'home#top'
  get '/about' => 'home#about'
  get '/index' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
