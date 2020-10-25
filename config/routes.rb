Rails.application.routes.draw do
  devise_for :users
  root 'cards#new'
  resources :items, expcept: :show
  resources :cards, only: [:new, :create] do
  end
end
