class InboundWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    puts "<<<<<<<<<<< PRODUCT CREATED WEBHOOK INITIATED >>>>>>>>>>>>>>>"
    puts params
    render status: 200, json: @controller.to_json
  end
end
