Rails.application.routes.draw do

  devise_for :users
  # カードのルーティングは他と紐付いていません
  # root "cards#new"
  # resources :items, expcept: :show
  # resources :cards, only: [:new, :create] do
  resources :users, only: :show
  
  root 'items#index'
  resources :categories, only: [:index] do
    member do
      get 'parent'
      get 'child'
      get 'grandchild'
    end
  end
  resources :items, except: :show

  #ajax用のルーティングを定義
  resources :items do
    collection do
      get :search
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end

end
