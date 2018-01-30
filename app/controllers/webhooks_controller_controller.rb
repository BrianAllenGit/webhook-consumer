class WebhooksControllerController < ApplicationController
  def receive
    puts "<<<<<<<<<<< PRODUCT CREATED WEBHOOK INITIATED >>>>>>>>>>>>>>>"
    puts params
    render nothing: true, status: 200
  end
end
