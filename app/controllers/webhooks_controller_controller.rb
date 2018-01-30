class WebhooksControllerController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def receive
    puts "<<<<<<<<<<< PRODUCT CREATED WEBHOOK INITIATED >>>>>>>>>>>>>>>"
    puts params
    render nothing: true, status: 200
  end
end
