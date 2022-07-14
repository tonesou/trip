Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "devise/registrations",
  sessions: 'devise/sessions'
  }

  devise_for :admin,skip: [:passwords], controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
  }

  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    # get "posts/genre" => "posts#genre"
    get "posts/genres/:id" => "posts#genre", as: :genre_show
  end
  resources :users, only: [:show, :edit, :update]
  get 'homes/top'
  root to: "homes#top"
  get "homes/about" => "homes#about"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :admins do
    resources :users,only: [:index,:show,:edit,:update]
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end