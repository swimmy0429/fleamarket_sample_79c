Rails.application.routes.draw do


  devise_for :users
  root 'items#index'
  resources :items
  resources :categories, only: [:index] do
    member do
      get 'parent'
      get 'child'
      get 'grandchild'
    end
  end

end
