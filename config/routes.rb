Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recommendations, param: :slug
end
