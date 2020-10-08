Rails.application.routes.draw do
  root 'items#new'
  resources :items, expcept: :show
end
