class InboundWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    puts "<<<<<<<<<<< PRODUCT CREATED WEBHOOK INITIATED >>>>>>>>>>>>>>>"
    puts params
    puts params[:data]

    Rails.logger.info params
    Rails.logger.info params[:data]

    status = rand(0..50) == 50 ?  rand(200..500) : 200
    render status: status, json: @controller.to_json
  end
end
