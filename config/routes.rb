Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/webhooks/:account_id' => 'inbound_webhooks#receive'

  resources :customers
  root 'inbound_webhooks#index'
end
