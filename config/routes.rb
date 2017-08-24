Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions'
  }

  root 'static_pages#home'

  resources :recommendations, param: :slug

  post '/recommendations/:slug/deliver' => 'recommendations#deliver', as: :deliver_recommendation
  get '/recommendations/:slug/done'    => 'recommendations#done',    as: :done_recommendation

  post 'hooks/get_accept' => 'hooks/get_accept#notification'

  get '/baby', to: redirect('/staffs/sign_in')

end
