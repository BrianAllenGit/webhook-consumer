Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'inbound_webhooks#index'

  post '/:integration_name' => 'webhooks#receive', as: :receive_webhooks
end
