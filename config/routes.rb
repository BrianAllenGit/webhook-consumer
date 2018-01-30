Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/webhooks/' => 'inbound_webhooks#receive'
  root 'inbound_webhooks#index'

end
