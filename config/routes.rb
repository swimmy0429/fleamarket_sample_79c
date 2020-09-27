Rails.application.routes.draw do
  get 'put/up'
  get 'put/items'
  root 'items#put_up_items'
end
