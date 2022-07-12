Rails.application.routes.draw do

  devise_for :users
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end