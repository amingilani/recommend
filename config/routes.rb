Rails.application.routes.draw do
  root 'static_pages#home'

  resources :recommendations, param: :slug

  post '/recommendations/:slug/deliver' => 'recommendations#deliver', as: :deliver_recommendation
  get '/recommendations/:slug/done'    => 'recommendations#done',    as: :done_recommendation

end
