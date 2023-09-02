require 'sidekiq/web'
Rails.application.routes.draw do
  resources :dishes, only: [:new] do
    collection { post :import }
    delete :destroy_all, on: :collection
  end
  root 'dishes#index'
  get 'dish', to: 'dishes#show', as: 'dish'
  delete 'dishes/delete_all', to: 'dishes#delete_all', as: :delete_all_dishes
    mount Sidekiq::Web => '/sidekiq'
end
