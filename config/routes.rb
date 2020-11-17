Rails.application.routes.draw do

  devise_for :users
  # カードのルーティングは他と紐付いていません
  # root "cards#new"
  # resources :items, expcept: :show
  resources :cards, only: [:new, :show, :destroy, :create] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
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
      get 'get_category_children', defaults: { format: 'json'}
      get 'get_category_grandchildren', defaults: { format: 'json'}
    end
  end

  resources :items do
    resources :purchases, only: [:index] do
      collection do
        get 'done', to: 'purchases#done'
        post 'pay', to: 'purchases#pay'
      end
    end
  end
  resources :searches,only:[:index]

  # マイページのルーティングにネスト
  resources :users, only: [:show, :edit, :update] do
  get :favorites, on: :collection
  end

  # 記事詳細表示のルーティングにネスト
  resources :items, expect: [:index] do
  resource :favorites, only: [:create, :destroy]
  end

end
