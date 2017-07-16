Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recommendations, param: :slug

  post '/recommendations/:slug/deliver' => 'recommendations#deliver', as: :deliver_recommendation

end
