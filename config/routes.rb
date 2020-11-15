Rails.application.routes.draw do

  devise_for :users

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
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
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
end
